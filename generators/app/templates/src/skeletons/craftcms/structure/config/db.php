<?php
/**
 * Database Configuration
 */

return array(
  // All environments
  '*' => array(
    'tablePrefix' => 'craft',
    'server' => getenv('CRAFTENV_DB_HOST'),
    'database' => getenv('CRAFTENV_DB_NAME'),
    'user' => getenv('CRAFTENV_DB_USER'),
    'password' => getenv('CRAFTENV_DB_PASS'),
  ),

  // Live (production) environment
  'productive'  => array(
  ),

  // Staging (pre-production) environment
  'staging'  => array(
  ),

  // Local (development) environment
  'local'  => array(
  ),
);
