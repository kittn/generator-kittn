<?php
/**
 * Plugin Name: Debug This
 * Plugin URI: https://www.wpmission.com/downloads/debug-this
 * Description: Peek under the hood with sixty debugging reports just one click away.
 * Version: 0.5.1
 * Author: Brian Fegter, Chris Dillon
 * Author URI: https://www.wpmission.com
 * License: GPLv3 or Later
 *
 * Copyright 2012-2017 Brian Fegter (brian@fegter.com), Chris Dillon (chris@wpmission.com)
 *
 * Original Plugin URI: http://coderrr.com/debug-this-wordpress-plugin
 * Original Author URI: http://coderrr.com
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License, version 2, as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

defined( 'ABSPATH' ) || die();

class Debug_This {
	protected $buffer;
	protected $debug;
	protected $description;
	public static $mode;
	public static $query_var = 'debug-this';
	public static $no_pre = false;
	protected $default_mode = 'wp_query';
	protected $original_template;
	public static $execution_time;
	public static $queries;
	protected $nonce_action = 'dEbUg-ThIs';
	public static $debug_header;
	public static $template_included;

	public function __construct() {
		if (
			$this->is_user_permitted()
			&& ! is_admin()
		) {
			include_once dirname( __FILE__ ) . '/inc/extensions.php';
			add_filter( 'query_vars', array( $this, 'add_query_var' ), 90210 );
			add_action( 'plugins_loaded', array( $this, 'load_textdomain' ) );
			add_action( 'wp_enqueue_scripts', array( $this, 'enqueue' ), 90210 );
			add_action( 'admin_bar_menu', array( $this, 'admin_bar' ), 90210 );
			add_action( 'shutdown', array( $this, 'render_fetch_data' ), 90210 );

			add_filter( 'template_include', array( $this, 'template_include_filter' ), 1000 );
		}

		if (
			$this->is_user_permitted()
			&& $this->is_debug()
			&& ! is_admin()
		) {
			add_action( 'all', array( $this, 'log_current_filters_and_actions' ) );
			add_filter( 'template_include', array( $this, 'template_include' ), 90210, 1 );
			add_filter( 'template_redirect', array( $this, 'buffer_page' ), 90210 );
			add_action( 'debug_this', array( $this, 'debug' ), self::$mode, 5 );
		}
	}

	public function load_textdomain() {
		load_plugin_textdomain( 'debug-this', false, plugin_basename( __FILE__ ) . '/languages/' );
	}

	public function enqueue() {
		if ( $this->is_debug() ) {
			wp_enqueue_style( 'debug-this', plugins_url( 'inc/css/debug-this.css', __FILE__ ) );
		}
		wp_enqueue_script( 'jquery' );
		wp_enqueue_script( 'debug-this', plugins_url( 'inc/js/debug-this.js', __FILE__ ), array( 'jquery' ) );
		$l10n = array(
			'mode'        => self::$mode,
			'defaultMode' => $this->default_mode,
			'template'    => $this->original_template,
			'queryVar'    => self::$query_var
		);
		wp_localize_script( 'debug-this', 'debugThis', $l10n );
		wp_enqueue_script( 'debug-this-trigger', plugins_url( 'inc/js/debug-this-trigger.js', __FILE__ ), array( 'debug-this' ), '', true );
	}

	public function add_query_var( $vars ) {
		$vars[] = self::$query_var;
		$vars[] = self::$query_var . "-fetch";
		$vars[] = self::$query_var . "-key";
		$vars[] = self::$query_var . "-ts";
		$vars[] = self::$query_var . "-nonce";

		return $vars;
	}

	public function template_include( $template ) {
		$this->original_template = $template;
		$template                = dirname( __FILE__ ) . '/inc/debug-template.php';
		$template                = apply_filters( 'debug_this_template', $template );

		return $template;
	}

	protected function is_fetch() {
		if (
			get_query_var( self::$query_var . "-fetch" ) &&
			get_query_var( self::$query_var . "-ts" ) &&
			get_query_var( self::$query_var . "-key" ) &&
			get_query_var( self::$query_var . "-nonce" )
		) {
			$time  = get_query_var( self::$query_var . "-ts" );
			$nonce = get_query_var( self::$query_var . "-nonce" );
			$key   = get_query_var( self::$query_var . "-key" );

			//Security #1 - Time range
			if ( ( time() - $time ) > 20000 ) {
				return false;
			}

			//Security #2 - Verify nonce
			if ( ! wp_verify_nonce( $nonce, $this->nonce_action ) ) {
				return false;
			}

			//Security #3 - Verify key with shared secret wp_salt
			$key_to_match = md5( $time . wp_salt( 'logged_in' ) . $nonce );
			if ( $key === $key_to_match ) {
				return true;
			}
		} else {
			return false;
		}
	}

	public function render_fetch_data() {
		if ( ! $this->is_fetch() ) {
			return;
		}

		global $wpdb;

		echo '%DEBUG_THIS%';

		$execution_time = timer_stop( 0, 10 );
		echo "%DEBUG_TIME%$execution_time%/DEBUG_TIME%";

		if ( defined( 'SAVEQUERIES' ) && $wpdb->queries ) {
			echo '%DEBUG_QUERIES%' . json_encode( $wpdb->queries ) . '%/DEBUG_QUERIES%';
		}

		echo '%/DEBUG_THIS%';
	}

	public function buffer_page() {

		global $wp;

		$time  = time();
		$nonce = wp_create_nonce( $this->nonce_action );

		$fetch_vars = array(
			self::$query_var . "-fetch" => true,
			self::$query_var . "-key"   => md5( $time . wp_salt( 'logged_in' ) . $nonce ),
			self::$query_var . "-ts"    => $time,
			self::$query_var . "-nonce" => $nonce
		);

		$query_vars = $wp->query_vars;
		unset( $query_vars[ self::$query_var ] );

		$vars         = array_merge( $fetch_vars, $query_vars );
		$query_string = http_build_query( $vars );

		$url = get_bloginfo( 'url' ) . '/' . $wp->request . "?$query_string";

		#Set auth headers for remote fetch
		$cookie_string = '';
		foreach ( $_COOKIE as $k => $v ) {
			if ( preg_match( '/(wordpress_test_cookie|wordpress_logged_in_|wp-settings-1|wp-settings-time-1)/', $k ) ) {
				$cookie_string .= $k . '=' . urlencode( $v ) . '; ';
			}
		}
		$cookie_string = trim( $cookie_string, '; ' );
		$headers       = array(
			'Cookie' => $cookie_string
		);

		$http     = new WP_Http;
		$response = $http->request( $url, array( 'method' => 'GET', 'headers' => $headers ) );
		if ( is_wp_error( $response ) ) {
			$buffer = $response->get_error_message();
		} else {
			$buffer = $response['body'];
		}
		preg_match( '/%DEBUG_TIME%(.+)%\/DEBUG_TIME%/', $buffer, $matches );
		self::$execution_time = $matches[1];

		if ( preg_match( '/%DEBUG_QUERIES%(.+)%\/DEBUG_QUERIES%/', $buffer, $matches ) ) {
			if ( $matches[1] ) {
				self::$queries = json_decode( $matches[1] );
			}
		}

		$this->buffer = preg_replace( '/%DEBUG_THIS%.+%\/DEBUG_THIS%/', '', $buffer );
	}

	protected function is_debug() {
		if ( isset( $_GET[ self::$query_var ] ) ) {
			self::$mode = $_GET[ self::$query_var ] ? $_GET[ self::$query_var ] : apply_filters( 'debug_this_default_mode', $this->default_mode );

			return true;
		}
	}

	protected function is_user_permitted() {
		return is_user_logged_in() && is_super_admin() ? true : false;
	}

	protected function is_domain_permitted() {
		return preg_match( '/(stage|dev|local)/', $_SERVER['SERVER_NAME'] );
	}

	public static function get_no_pre() {
		return self::$no_pre;
	}

	public function debug() {
		global $_debugger_extensions;
		if ( isset( $_debugger_extensions[ self::$mode ] ) && is_array( $_debugger_extensions[ self::$mode ] ) ) {
			$extension         = $_debugger_extensions[ self::$mode ];
			$this->debug       = call_user_func( $extension['callback'], $this->buffer, $this->original_template );
			$this->debug       = apply_filters( 'debug_this_output', $this->debug, self::$mode );
			$this->description = $extension['description'];
			$this->_render();
		} else {
			$debug = '<span class="error">' . __( 'A debug extension could not be found.', 'debug-this' ) . "</span>\n\n";
			$debug .= $this->include_example_extension();
			$this->debug = $debug;
			$this->_render();
		}
	}

	protected function _render() {
		$description = $this->description ? ' - ' . $this->description : '';
		echo '<p>' . __( 'Debug This Mode', 'debug-this' ) . ': <strong>' . self::$mode . '</strong>' . $description . '</p>';
		echo '<ul class="header-links">' . self::$debug_header . '</ul>';
		echo $this->debug;
	}

	protected function include_example_extension() {
		$output = file_get_contents( dirname( __FILE__ ) . '/inc/example-extension.txt' );
		$output = htmlentities( str_replace( '$mode', self::$mode, $output ) );
		$output = '<p>' . __( 'Example Debug Extension', 'debug-this' ) . '</p>' . $output;

		return $output;
	}

	public function admin_bar() {
		global $wp_admin_bar, $wp;
		if ( ! is_super_admin() || ! is_admin_bar_showing() ) {
			return;
		}

		#Build out query string
		$vars                     = $wp->query_vars;
		$vars[ self::$query_var ] = $this->default_mode;
		$query_string             = http_build_query( $vars );


		$wp_admin_bar->add_menu( array( 'id'    => 'debug_this',
		                                'title' => __( 'Debug This', 'debug-this' ),
		                                'href'  => "?$query_string"
		) );
		foreach ( $this->get_extensions_by_group() as $group => $extensions ) {
			if ( $group === 'Hide' ) {
				continue;
			}
			$group_title = ucwords( str_replace( '-', ' ', $group ) );
			$wp_admin_bar->add_menu( array( 'id'     => $group,
			                                'parent' => 'debug_this',
			                                'title'  => $group_title,
			                                'href'   => false
			) );
			foreach ( $extensions as $id => $values ) {
				#Update query string
				$vars[ self::$query_var ] = $id;
				$query_string             = http_build_query( $vars );
				$wp_admin_bar->add_menu( array( 'id'     => $id,
				                                'parent' => $group,
				                                'title'  => $values['name'],
				                                'href'   => "?$query_string"
				) );
			}
		}
	}

	protected function get_extensions_by_group() {
		global $_debugger_extensions;
		foreach ( $_debugger_extensions as $id => $values ) {
			if ( $id === 'help' ) {
				continue;
			} else {
				$grouped[ $values['group'] ][ $id ] = $values;
			}
		}
		ksort( $grouped );

		return $grouped;
	}

	public function log_current_filters_and_actions() {
		global $debug_this_current_filter;
		$debug_this_current_filter[] = current_filter();
	}

	public static function get_escape_url() {
		global $wp;

		$permalinks = get_option( 'permalink_structure' );
		if ( $permalinks ) {
			$url = $wp->request;
		} else {
			$vars = $wp->query_vars;
			foreach ( $vars as $k => $v ) {
				if ( $v === self::$mode ) {
					unset( $vars[ $k ] );
				}
			}
			$url = ! empty( $vars ) ? '?' . http_build_query( $vars ) : '';
		}

		return $url;
	}

	public static function get_current_debug_url() {
		$url = self::get_escape_url();
		$url .= '&' . self::$query_var . '=' . self::$mode;

		return $url;
	}

	public function template_include_filter( $template ) {
		self::$template_included = $template;

		return $template;
	}

}

add_action( 'init', 'debug_this_init', 0 );
function debug_this_init() {
	new Debug_This;
}

function add_debug_extension( $id, $name, $description, $callback, $group = 'General' ) {
	global $_debugger_extensions;
	$_debugger_extensions[ $id ] = array(
		'name'        => $name,
		'description' => $description,
		'callback'    => $callback,
		'group'       => $group
	);
}

function remove_debug_extension( $id ) {
	global $_debugger_extensions;
	if ( isset( $_debugger_extensions[ $id ] ) ) {
		unset( $_debugger_extensions[ $id ] );
	}
}

function add_debug_header_link( $url, $label, $classes = '' ) {
	Debug_This::$debug_header = Debug_This::$debug_header . "<li><a href='$url' class='$classes'>$label</a></li>";
}

function debug_this_get_file_ownership( $file ) {
	$stat = stat( $file );
	if ( $stat ) {
		$group = posix_getgrgid( $stat[5] );
		$user  = posix_getpwuid( $stat[4] );

		return compact( 'user', 'group' );
	} else {
		return false;
	}
}

function debug_this_get_file_perms( $file ) {
	return substr( sprintf( '%o', fileperms( $file ) ), - 4 );
}

function debug_this_convert_perms_to_rwx( $perms, $file ) {
	$rwx    = array(
		'---',
		'--x',
		'-w-',
		'-wx',
		'r--',
		'r-x',
		'rw-',
		'rwx'
	);
	$type   = is_dir( $file ) ? 'd' : '-';
	$user   = $perms[1];
	$group  = $perms[2];
	$public = $perms[3];

	return $type . $rwx[ $user ] . $rwx[ $group ] . $rwx[ $public ];
}
