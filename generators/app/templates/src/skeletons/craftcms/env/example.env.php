<?php
/**
 * Craft-Multi-Environment (CMS)
 */

// Determine the incoming protocol
if (isset($_SERVER['HTTPS']) && (strcasecmp($_SERVER['HTTPS'], 'on') === 0 || $_SERVER['HTTPS'] == 1)
    || isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && strcasecmp($_SERVER['HTTP_X_FORWARDED_PROTO'], 'https') === 0
) {
  $protocol = "https://";
} else {
  $protocol = "http://";
}

$craftenv_vars = array(
   // The Craft environment we're running in ('local', 'staging', 'productive', etc.).
  'CRAFT_ENVIRONMENT' => 'SETUP',
  'DB_HOST' => 'SETUP',
  'DB_NAME' => 'SETUP',
  'DB_USER' => 'SETUP',
  'DB_PASS' => 'SETUP',
  // Path configs
  'SITE_URL' => $protocol . $_SERVER['HTTP_HOST'] . '/',
  'BASE_URL' => $protocol . $_SERVER['HTTP_HOST'] . '/',
  'BASE_PATH'=> realpath(dirname(__FILE__)) . '/public/'
);
// Set all of the .env values, auto-prefixed with `CRAFTENV_`
foreach ($craftenv_vars as $key => $value) {
  putenv("CRAFTENV_$key=$value");
}

/**
 * For production environments, this .env.php file can be used, or preferably,
 * (for security & speed), set the $_ENV variables directly from the server config.

// Apache - inside the <VirtualHost> block:
SetEnv CRAFTENV_CRAFT_ENVIRONMENT "REPLACE_ME"
SetEnv CRAFTENV_DB_HOST "REPLACE_ME"
SetEnv CRAFTENV_DB_NAME "REPLACE_ME"
SetEnv CRAFTENV_DB_USER "REPLACE_ME"
SetEnv CRAFTENV_DB_PASS "REPLACE_ME"
SetEnv CRAFTENV_SITE_URL "REPLACE_ME"
SetEnv CRAFTENV_BASE_URL "REPLACE_ME"
SetEnv CRAFTENV_BASE_PATH "REPLACE_ME"

// Nginx - inside the server {} or location ~ \.php$ {} block:
fastcgi_param CRAFTENV_CRAFT_ENVIRONMENT "REPLACE_ME";
fastcgi_param CRAFTENV_DB_HOST "REPLACE_ME";
fastcgi_param CRAFTENV_DB_NAME "REPLACE_ME";
fastcgi_param CRAFTENV_DB_USER "REPLACE_ME";
fastcgi_param CRAFTENV_DB_PASS "REPLACE_ME";
fastcgi_param CRAFTENV_SITE_URL "REPLACE_ME";
fastcgi_param CRAFTENV_BASE_URL "REPLACE_ME";
fastcgi_param CRAFTENV_BASE_PATH "REPLACE_ME";
 */
