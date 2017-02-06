<?php
/**
 * General Configuration
 */

return array(
  // Global for all Environments
  '*' => array(
    'usePathInfo' => true,
    'cacheDuration' => false,
    'useEmailAsUsername' => false,
    'limitAutoSlugsToAscii' => true,
    'generateTransformsBeforePageLoad' => true,
    'addTrailingSlashesToUrls' => true,
    'defaultWeekStartDay' => 1,
    'sendPoweredByHeader' => false,
    'cooldownDuration' => 0,
    'siteUrl' => getenv('CRAFTENV_SITE_URL'),
    'craftEnv' => CRAFT_ENVIRONMENT,
    'environment' => CRAFT_ENVIRONMENT,
    // Set the environmental variables
    'environmentVariables' => array(
      'baseUrl'  => getenv('CRAFTENV_BASE_URL'),
      'basePath' => getenv('CRAFTENV_BASE_PATH'),
    ),
  ),
  // Productive Environment
  'productive'  => array(
    'allowAutoUpdates' => false
  ),
  // Stage or Test Environment
  'staging'  => array(
    'allowAutoUpdates' => false
  ),
  // Local Development
  'local'  => array(
    'devMode' => true,
    'enableTemplateCaching' => false,
    'allowAutoUpdates' => true,
    'cacheElementQueries' => false,
    'enableTemplateCaching' => false,
    'useCompressedJs' => false
  )
);

