<?php
/**
 * Element API Configuration File
 * Docu: https://github.com/pixelandtonic/ElementAPI
 */

namespace Craft;


return [
  'defaults' => [
    'elementsPerPage' => 10
  ],
  
  'endpoints' => [ 
  
    // Just a Example 
    'news.json' => [
      'criteria' => ['section' => 'news'],
    ],
    
    'news/<entryId:\d+>.json' => function($entryId) {
      return [
        'criteria' => ['id' => $entryId],
        'first' => true,
      ];
    }
  ]
];
