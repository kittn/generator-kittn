<?php
/**
  Media Image Set
  ===============
  Generate a Media Image Set for Lazyload in different formats
*/

function macro_mediaImageSet($image,$classname,$format) {
  $imageset = '';
  $imagepre = '';

  if ($image) {
    // Generate Image Set
    switch ($format) :
      // Imageset Cropfactor: 16:9
      case 'wide' :
        $imageset  =  $image['sizes']['wide_large'] . ' 1200w, ';
        $imageset .=  $image['sizes']['wide_medium'] . ' 800w, ';
        $imageset .=  $image['sizes']['wide_small'] . ' 400w, ';
        $imageset .=  $image['sizes']['wide_mini'] . ' 100w ';
        $imagepre  =  $image['sizes']['wide_mini'];
        break;
      // Imageset Cropfactor: 21:10
      case 'extrawide' :
        $imageset  =  $image['sizes']['extrawide_large'] . ' 1200w, ';
        $imageset .=  $image['sizes']['extrawide_medium'] . ' 800w, ';
        $imageset .=  $image['sizes']['extrawide_small'] . ' 400w, ';
        $imageset .=  $image['sizes']['extrawide_mini'] . ' 100w ';
        $imagepre  =  $image['sizes']['extrawide_mini'];
        break;
      // Imageset Cropfactor: 1:1
      case 'square' :
        $imageset  =  $image['sizes']['square_large'] . ' 1200w, ';
        $imageset .=  $image['sizes']['square_medium'] . ' 800w, ';
        $imageset .=  $image['sizes']['square_small'] . ' 400w, ';
        $imageset .=  $image['sizes']['square_mini'] . ' 100w ';
        $imagepre  =  $image['sizes']['square_mini'];
        break;
      // Imageset Cropfactor: 4:3
      case 'rect' :
        $imageset  =  $image['sizes']['rect_large'] . ' 1200w, ';
        $imageset .=  $image['sizes']['rect_medium'] . ' 800w, ';
        $imageset .=  $image['sizes']['rect_small'] . ' 400w, ';
        $imageset .=  $image['sizes']['rect_mini'] . ' 100w ';
        $imagepre  =  $image['sizes']['rect_mini'];
        break;
      case 'uncropped' :
        $imageset  =  $image['sizes']['rw_wide'] . ' 1200w, ';
        $imageset .=  $image['sizes']['rw_desktop'] . ' 960w, ';
        $imageset .=  $image['sizes']['rw_tablet'] . ' 768w, ';
        $imageset .=  $image['sizes']['rw_medium'] . ' 480w, ';
        $imageset .=  $image['sizes']['rw_small'] . ' 320w, ';
        $imageset .=  $image['sizes']['rw_micro'] . ' 150w ';
        $imagepre  =  $image['sizes']['rw_small'];
        break;
    endswitch;
  }

  echo '<img data-sizes="auto" src="'.$imagepre.'" data-srcset="'.$imageset.'" class="'.$classname.' lazyload" role="img" alt="'.$image["alt"].'" itemprop="thumbnail">';
}
