<?php
/**
 * General Configuration
 *
 * All of your system's general configuration settings go in here. You can see a
 * list of the available settings in vendor/craftcms/cms/src/config/GeneralConfig.php.
 *
 * @see craft\config\GeneralConfig
 */

return [
    // Global settings
    '*' => [
        // Default Week Start Day (0 = Sunday, 1 = Monday...)
        'defaultWeekStartDay' => 1,

        // Enable CSRF Protection (recommended)
        'enableCsrfProtection' => true,

        // Whether generated URLs should omit "index.php"
        'omitScriptNameInUrls' => true,

        // Control Panel trigger word
        'cpTrigger' => 'admin',

        // The secure key Craft will use for hashing and encrypting data
        'securityKey' => getenv('SECURITY_KEY'),

        'rootUrl' => getenv('CRAFTENV_SITE_URL'),

        'siteUrl' => array( // Mulilanguage Config
          'de' => getenv('CRAFTENV_SITE_URL'),
          'en' => getenv('CRAFTENV_SITE_URL').'en/'
        ),
        'craftEnv' => CRAFT_ENVIRONMENT,
        'environment' => CRAFT_ENVIRONMENT,
        'aliases' => array(
          'baseUrl'  => getenv('CRAFTENV_BASE_URL'),
          'basePath' => getenv('CRAFTENV_BASE_PATH'),
        ),
        'locales' => array(
          'de', 'en'
        ),
        'currentLanguage' => array(
          'de_de' => 'de',
          'de' => 'de',
          'en_us' => 'en',
          'en' => 'en'
        ),
        'imageRatios' => array(
          'featuredImage' => array(
            'thumb' => '5:3',
            'regular' => '16:9'
          )
        )
    ],
    // Local Development
    'local'  => array(
      'devMode' => true,
      'enableTemplateCaching' => false,
      'allowUpdates' => true,
      'cacheElementQueries' => false,
      'useCompressedJs' => false
    ),

    // Staging environment settings
    'staging' => [
        'allowUpdates' => false,
        'enableTemplateCaching' => false,
    ],

    // Production environment settings
    'production' => [
        'allowUpdates' => false
    ],
];
