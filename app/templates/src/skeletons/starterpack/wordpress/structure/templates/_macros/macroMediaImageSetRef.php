<?php
/**
 * Media Image Set Reference
 * =========================
 * Generate a Media Image Set for Lazyload in different formats. It references to
 * the defined Images Sizes, to make it Smarter
 *
 * @param {object} $image      = Image
 * @param {string} $classname  = Classname from the Element
 * @param {string} $format     = Imageformat [uncropped, wide, extrawide, square, rect]
 * @param {bool}   $background = Background Option
 * @param {string} $tag        = Tag for Background Element (default: 'figure')
 */
function macro_mediaImageSet($image,$classname,$format,$background = false) {
  // Getting defined Sizes
  global $CROPPED_FORMAT,$CROPPED_SIZES,$UNCROPPED_SIZES;

  $imageset = '';
  $imagepre = '';
  $imageformats = ['uncropped'];

  // Build a allowed list of cropformats
  foreach ($CROPPED_FORMAT as $key => $value) {
    array_push($imageformats,$key);
  }

  if ($image) {
    // Check Imageformat
    if (in_array($format, $imageformats)) {
      // Generate Image Set
      if ($format == 'uncropped') {
        foreach ($UNCROPPED_SIZES as $key => $value) {
          $imageset .= $image['sizes']['rw_'.$key].' '.$value.'w'.(!next($UNCROPPED_SIZES) ? ' ' : ', ');
        }
        // Define Preload Image
        $imagepre = $image['sizes']['rw_'.key(array_slice($UNCROPPED_SIZES, -1, true))];

      } else {
        foreach ($CROPPED_SIZES as $key => $value) {
          $imageset .= $image['sizes'][$format.'_'.$key].' '.$value.'w'.(!next($CROPPED_SIZES) ? ' ' : ', ');
        }
        // Define Preload Image
        $imagepre = $image['sizes'][$format.'_'.key(array_slice($CROPPED_SIZES, -1, true))];
      }

      // Output as <img> or Background
      if ($background) {
        echo '<'.$tag.' class="'.$classname.' lazyload" style="background-image: url('.$imagepre.')" data-sizes="auto" data-bgset="'.$imageset.'"></'.$tag.'>';
      } else {
        echo  '<img data-sizes="auto" src="'.$imagepre.'" data-srcset="'.$imageset.'" class="'.$classname.' lazyload" role="img" alt="'.$image["alt"].'" itemprop="thumbnail">';
      }

    } else {
      echo '<p style="color:red">Wrong Image Format ['.$format.']!<br> Use the Following: uncropped, wide, extrawide, square or rect </p>';
    }
  }
}

