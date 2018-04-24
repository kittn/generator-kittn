<?php
/**
 * Transformer
 * ===========
 * For Blog Single
 */

namespace Craft;

require craft()->path->getPluginsPath() . 'elementapi/vendor/autoload.php';

use League\Fractal\TransformerAbstract;

class blogSingleTransformer extends TransformerAbstract {
  public function transform( EntryModel $entry ) {

    // Get Categorys
    $cats = [];
    foreach($entry->blog as $cat) {
      $cats[] = $cat->title;
    }

    // Include Content Builder
    require craft()->path->getConfigPath().'elementapi/inc/contentbuilder.php';

    return [
      'title'          => $entry->title,
      'author'         => $entry->author->name,
      'date'           => $entry->postDate,
      'category'       => $cats,
      'contentbuilder' => $contentbuilder

    ];
  }
}
