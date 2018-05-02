<?php
/**
 * The base configuration for WordPress
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// Getting Hostname and Protocol
$http_host = $_SERVER['HTTP_HOST'];
if (isset($_SERVER['HTTPS']) && (strcasecmp($_SERVER['HTTPS'], 'on') === 0 || $_SERVER['HTTPS'] == 1)
    || isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && strcasecmp($_SERVER['HTTP_X_FORWARDED_PROTO'], 'https') === 0
) {
  $protocol = "https://";
} else {
  $protocol = "http://";
}

// Location of environment-specific configuration
$wp_env_config = 'wp-config/wp-env.php';

// Check to see if the configuration file for the environment exists
if (file_exists( __DIR__ . '/' . $wp_env_config)) {
  require_once($wp_env_config);
} else {
  // Exit if configuration file does not exist
  exit('No database configuration found for this host');
}

// Global URL Config
define('WP_HOME', $protocol . $http_host);
define('WP_SITEURL', $protocol . $http_host);

// Global DB Config
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

// WordPress Database Table prefix.
$table_prefix  = 'wpkittn_';

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'put your unique phrase here');
define('SECURE_AUTH_KEY',  'put your unique phrase here');
define('LOGGED_IN_KEY',    'put your unique phrase here');
define('NONCE_KEY',        'put your unique phrase here');
define('AUTH_SALT',        'put your unique phrase here');
define('SECURE_AUTH_SALT', 'put your unique phrase here');
define('LOGGED_IN_SALT',   'put your unique phrase here');
define('NONCE_SALT',       'put your unique phrase here');

/**#@-*/

// Absolute path to the WordPress directory
if ( !defined('ABSPATH') )
  define('ABSPATH', dirname(__FILE__) . '/');

// Sets up WordPress vars and included files
require_once(ABSPATH . 'wp-settings.php');
