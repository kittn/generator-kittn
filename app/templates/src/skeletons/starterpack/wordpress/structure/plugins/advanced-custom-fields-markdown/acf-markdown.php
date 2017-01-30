<?php

/*
Plugin Name: Advanced Custom Fields: Markdown
Plugin URI: https://github.com/jensjns/acf-markdown-field
Description: Adds a markdown-field.
Version: 1.1.4
Author: jensnilsson
Author URI: http://jensnilsson.nu
License: GPLv2 or later
License URI: http://www.gnu.org/licenses/gpl-2.0.html
*/




// 1. set text domain
// Reference: https://codex.wordpress.org/Function_Reference/load_plugin_textdomain
load_plugin_textdomain( 'acf-markdown', false, dirname( plugin_basename(__FILE__) ) . '/lang/' );




// 2. Include field type for ACF5
// $version = 5 and can be ignored until ACF6 exists
function include_field_types_markdown( $version ) {

	include_once('acf-markdown-v5.php');

}

add_action('acf/include_field_types', 'include_field_types_markdown');




// 3. Include field type for ACF4
function register_fields_markdown() {

	include_once('acf-markdown-v4.php');

}

add_action('acf/register_fields', 'register_fields_markdown');

?>