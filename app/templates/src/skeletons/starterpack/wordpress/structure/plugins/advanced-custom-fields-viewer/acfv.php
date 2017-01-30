<?php
/*
 * Plugin Name: Advanced Custom Fields Viewer
 * Version: 1.2.1
 * Plugin URI: https://wordpress.org/plugins/advanced-custom-fields-viewer/
 * Description: View Advanced Custom Fields data on the front end of your theme while developing.
 * Author: Joseph Fusco
 * Author URI: http://josephfus.co/
 */

if ( !defined( 'ABSPATH' ) ) exit;

global $acfv;

require_once( plugin_dir_path( __FILE__ ) . 'admin/general.php' );
require_once( plugin_dir_path( __FILE__ ) . 'admin/options.php' );
require_once( plugin_dir_path( __FILE__ ) . 'viewer.php' );

function acfv( $arg_custom = NULL ){

	global $acfv;

	$acfv = $arg_custom;

}
