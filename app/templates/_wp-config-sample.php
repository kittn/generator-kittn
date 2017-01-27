<?php
/**
 * The base configuration for WordPress
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// Set your environment/url pairs
$environments = array(
  'local'       => '<%= credentialdomain %>',
  'stage'       => 'stage.domain'
);

// Get the hostname
$http_host = $_SERVER['HTTP_HOST'];

// Loop through $environments to see if there’s a match
foreach($environments as $environment => $hostname) {
  if (stripos($http_host, $hostname) !== FALSE) {
    define('ENVIRONMENT', $environment);
    break;
  }
}

// Exit if ENVIRONMENT is undefined
if (!defined('ENVIRONMENT')) exit('No database configured for this host');

// Location of environment-specific configuration
$wp_db_config = 'wp-config/wp-db--' . ENVIRONMENT . '.php';

// Check to see if the configuration file for the environment exists
if (file_exists( __DIR__ . '/' . $wp_db_config)) {
  require_once($wp_db_config);
} else {
  // Exit if configuration file does not exist
  exit('No database configuration found for this host');
}

// Global DB Config
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

// WordPress Database Table prefix.
$table_prefix  = 'wp_';

/**#@+
 * Authentication Unique Keys and Salts.
 * @since 2.6.0
 */
define('AUTH_KEY',         '<%= saltKeys[0] %>');
define('SECURE_AUTH_KEY',  '<%= saltKeys[1] %>');
define('LOGGED_IN_KEY',    '<%= saltKeys[2] %>');
define('NONCE_KEY',        '<%= saltKeys[3] %>');
define('AUTH_SALT',        '<%= saltKeys[4] %>');
define('SECURE_AUTH_SALT', '<%= saltKeys[5] %>');
define('LOGGED_IN_SALT',   '<%= saltKeys[6] %>');
define('NONCE_SALT',       '<%= saltKeys[7] %>');
/**#@-*/

// Absolute path to the WordPress directory.
if ( !defined('ABSPATH') )
  define('ABSPATH', dirname(__FILE__) . '/');

// Sets up WordPress vars and included files.
require_once(ABSPATH . 'wp-settings.php');
