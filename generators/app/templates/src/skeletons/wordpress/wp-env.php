<?php
// Prevent file from being accessed directly
if (!defined('ABSPATH')) exit();

define('DB_NAME',     '<%= credentialdbdatabase %>');
define('DB_USER',     '<%= credentialdbuser %>');
define('DB_PASSWORD', '<%= credentialdbpass %>');
define('DB_HOST',     '<%= credentialdbserver %>');

define('WP_DEBUG',    true);
define('WP_ENV',      'local'); // 'local', 'stage', 'productive'
