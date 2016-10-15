<?php

/**
 * Database Configuration
 *
 * All of your system's database configuration settings go in here.
 * You can see a list of the default settings in craft/app/etc/config/defaults/db.php
 */

return array(
  '*' => array(
    'tablePrefix' => 'craft'
  ),
  '<%= credentialdomain %>' => array(
    'server'   => '<%= credentialdbserver %>',
    'user'     => '<%= credentialdbuser %>',
    'password' => '<%= credentialdbpass %>',
    'database' => '<%= credentialdbdatabase %>'
  ),
  'PROD:DOMAIN' => array(
    'server'   => 'localhost',
    'user'     => '',
    'password' => '',
    'database' => ''
  )
);
