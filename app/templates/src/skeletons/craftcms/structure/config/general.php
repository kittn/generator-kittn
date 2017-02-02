<?php
/**
 * General Configuration
 */

return array(
  // Global for all Environments
  '*' => array(
    'omitScriptNameInUrls' => true,
    'usePathInfo' => true,
    'cacheDuration' => false,
    'useEmailAsUsername' => true,
    'generateTransformsBeforePageLoad' => true,
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
    'devMode' => false,
    'enableTemplateCaching' => true,
    'allowAutoUpdates' => false,
    'cache' => true,
    'cooldownDuration' => 0,
    'useCompressedJs' => true
  ),
  // Stage or Test Environment
  'staging'  => array(
    'devMode' => false,
    'enableTemplateCaching' => true,
    'allowAutoUpdates' => false,
  ),
  // Local Development
  'local'  => array(
    'devMode' => true,
    'enableTemplateCaching' => false,
    'allowAutoUpdates' => true,
  )
);

