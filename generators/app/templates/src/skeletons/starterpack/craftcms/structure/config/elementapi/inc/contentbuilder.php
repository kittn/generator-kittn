<?php
/**
 * ContentBuilder
 * ==============
 * For Element API
 */

namespace Craft;

// Content
$contentbuilder = [];

foreach($entry->contentBuilder->level[1] as $content) :
  switch ($content->type) :

    case 'objRichtext' : // ---------------------------
      require craft()->path->getConfigPath().'elementapi/inc/objects/objRichtext.php';
      break;

  endswitch;
endforeach;
