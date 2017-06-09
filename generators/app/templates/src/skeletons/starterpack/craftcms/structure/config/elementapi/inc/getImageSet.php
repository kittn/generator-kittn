<?php
/**
 * Get Image Sizes
 * ===============
 */

namespace Craft;

/**
 * Define a Set of Images for the exchange
 * @param $image
 * @return array
 */
function getImageSet($image) {
  return [
    'regular' => $image->getUrl(),
    '1200w'   => $image->getUrl(['width' => 1200 ]),
    '800w'    => $image->getUrl(['width' => 800 ]),
    '500w'    => $image->getUrl(['width' => 500 ]),
    '320w'    => $image->getUrl(['width' => 320 ]),
    '150w'    => $image->getUrl(['width' => 150 ])
  ];
}
