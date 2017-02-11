<?php
/**
 * Element API
 * ===========
 */

namespace Craft;

// Load Vendor Files
require craft()->path->getConfigPath().'elementapi/inc/getImageSet.php';

// Load Transformer
require craft()->path->getConfigPath().'elementapi/vendor/blogArchiveTransformer.php';
require craft()->path->getConfigPath().'elementapi/vendor/blogSingleTransformer.php';


return [
  'endpoints' => [
    // Blog Archive
    'blog.json' => [
      'elementsPerPage' => 20,
      'elementType' => 'Entry',
      'criteria' => ['section' => 'blog'],
      'transformer' => new blogArchiveTransformer()
    ],

    // Blog Single Entry
    'blog/<slug:{slug}>.json' => function($slug) {
      return [
        'elementType' => 'Entry',
        'criteria' => [ 'slug' => $slug ],
        'first' => true,
        'transformer' => new blogSingleTransformer(),
      ];
    }
  ]
];
