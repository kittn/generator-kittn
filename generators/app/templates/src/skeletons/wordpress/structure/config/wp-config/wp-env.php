<?php
// Prevent file from being accessed directly
if (!defined('ABSPATH')) exit();
define('DB_NAME',     '<%= projectcredential ? credentialdbdatabase : '' %>');
define('DB_USER',     '<%= projectcredential ? credentialdbuser : '' %>');
define('DB_PASSWORD', '<%= projectcredential ? credentialdbpass : '' %>');
define('DB_HOST',     '<%= projectcredential ? credentialdbserver : '' %>');

define('WP_DEBUG',    true);
define('WP_ENV',      'local'); // 'local', 'stage', 'productive'
