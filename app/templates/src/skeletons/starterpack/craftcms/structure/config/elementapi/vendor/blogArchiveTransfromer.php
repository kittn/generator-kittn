<?php
/**
 * Transformer
 * ===========
 * For Blog Archive
 */

namespace Craft;

require craft()->path->getPluginsPath() . 'elementapi/vendor/autoload.php';

use League\Fractal\TransformerAbstract;

class blogArchiveTransformer extends TransformerAbstract {
  public function transform( EntryModel $entry ) {

    // Get Categorys
    $cats = [];

    foreach($entry->blog as $cat) {
      $cats[] = $cat->title;
    }

    // Fallback for empty body
    if ($entry->body) {
      $excerpt = $entry->body->getParsedContent();
    } else {
      $excerpt = null;
    }

    return [
      'title' => $entry->title,
      'url' => $entry->url,
      'jsonUrl' => UrlHelper::getUrl("blog/{$entry->slug}.json"),
      'date' => $entry->postDate,
      'excerpt' => $excerpt,
      'category' => $cats
    ];
  }
}
