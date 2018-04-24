<?php
/**
 * Media Image Set
 * ===============
 * Generate a Media Image Set for Lazyload in different formats. Use this only if the
 * referencing MediaImageSet will not Work on your Server.
 *
 * @param {object} $image      = Image
 * @param {string} $classname  = Classname from the Element
 * @param {string} $format     = Imageformat [uncropped, wide, extrawide, square, rect]
 * @param {bool}   $background = Background Option
 * @param {string} $tag        = Tag for Background Element (default: 'figure')
 * @param {string} $position   = Optional background position for background images
 * @param {number} $offset     = Optional offset to reduce image sizes arrays
 */
function macro_mediaImageSet($image,$classname,$format,$background = false, $tag = 'figure', $position = false, $offset = 0) {
  $imageset = '';
  $imagepre = '';
  $backgroundPosition = '';
  $imageformats = ['uncropped', 'wide', 'extrawide', 'square', 'rect'];

  // Generate Background Positon
  if ($position) {
    $backgroundPosition = 'background-position: '.$position;
  }

  // Crop Size Array
  $cropsizes = [
    'large'  => ' 1200w, ',
    'medium' => ' 800w, ',
    'small'  => ' 400w, ',
    'mini'   => ' 100w, '
  ];

  // Uncropped Images Sizes
  $imagesizes = [
    'wide'    => ' 1200w, ',
    'desktop' => ' 960w, ',
    'tablet'  => ' 768w, ',
    'medium'  => ' 480w, ',
    'small'   => ' 320w, ',
    'micro'   => ' 150w '
  ];

  if ($image) {
    // Get Mime Type
    $imageMime = $image['mime_type'];

    // Check Imageformat
    if (in_array($format, $imageformats)) {
      // Get Imagesize array
      // Generate Image Set
      foreach (array_slice(($format != 'uncropped' ? $cropsizes : $imagesizes), $offset) as $key => $value) {
        $imageset .= $image['sizes'][$format.'_'.$key] . $value;
      }

      // Define Preload Image
      if ($format != 'uncropped') {
        $imagepre  =  $image['sizes'][$format.'_mini'];
      } else {
        $imagepre  =  $image['sizes']['rw_small'];
      }

      // Output as <img> or Background
      if ($background) {
        if ($imageMime == 'image/svg+xml') {
          // Check if Tag is used otherwise return a string
          if ($tag != false) {
            echo '<'.$tag.' class="'.$classname.'" style="background-image: url('.$imagepre.');'.$backgroundPosition.'"></'.$tag.'>';
          } else {
            echo 'class="'.$classname.'" style="background-image: url('.$imagepre.');'.$backgroundPosition.'"';
          }
        } else {
          // Check if Tag is used otherwise return a string
          if ($tag != false) {
            echo '<'.$tag.' class="'.$classname.' lazyload" style="background-image: url('.$imagepre.');'.$backgroundPosition.'" data-sizes="auto" data-bgset="'.$imageset.'"></'.$tag.'>';
          } else {
            echo 'class="'.$classname.' lazyload" style="background-image: url('.$imagepre.');'.$backgroundPosition.'" data-sizes="auto" data-bgset="'.$imageset.'"';
          }
        }
      } else {
        if ($imageMime == 'image/svg+xml') {
          echo  '<img src="'.$imagepre.'" class="'.$classname.'" role="img" alt="'.$image["alt"].'" itemprop="thumbnail">';
        } else {
          echo  '<img data-sizes="auto" src="'.$imagepre.'" data-srcset="'.$imageset.'" class="'.$classname.' lazyload" role="img" alt="'.$image["alt"].'" itemprop="thumbnail">';
        }
      }
    } else {
      echo '<p style="color:red">Wrong Image Format!<br> Use the Following: uncropped, wide, extrawide, square or rect </p>';
    }
  }
}
