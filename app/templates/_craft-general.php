<?php

/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here.
 * You can see a list of the default settings in craft/app/etc/config/defaults/general.php
 */

return array(
  '*' => array(
    'omitScriptNameInUrls' => true,
    'defaultWeekStartDay' => 1,
    'sendPoweredByHeader' => false,
    'generateTransformsBeforePageLoad' => true
  ),
  '<%= credentialdomain %>' => array(
    'siteUrl' => '<%= credentialprotocol %>://<%= credentialdomain %>/',
    'devMode' => true,
    'cache' => false,
    'useCompressedJs' => false,
    'enableTemplateCaching' => false,
    'environment' => 'local',
    'environmentVariables' => array(
      'basePath' => '//',
      'baseUrl'  => '<%= credentialprotocol %>://<%= credentialdomain %>/',
    )
  ),
  'PROD:DOMAIN' => array(
    'siteUrl' => 'https://PROD:DOMAIN/',
    'cooldownDuration' => 0,
    'devMode' => false,
    'cache' => true,
    'useCompressedJs' => true,
    'allowAutoUpdates' => true,
    'environment' => 'productive',
    'environmentVariables' => array(
      'basePath' => '//',
      'baseUrl'  => 'https://PROD:DOMAIN/',
    )
  )
);
