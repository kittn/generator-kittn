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
 * @param {string} $position   = Optional background position for background images
 * @param {number} $offset     = Optional offset to reduce image sizes arrays
 */
function macro_mediaImageSet($image,$classname,$format,$background = false, $tag = 'figure', $position = false, $offset = 0) {
  // Getting defined Sizes
  global $CROPPED_FORMAT,$CROPPED_SIZES,$UNCROPPED_SIZES;

  $imageset = array();
  $imagepre = '';
  $backgroundPosition = '';
  $imageformats = ['uncropped'];

  // Generate Background Positon
  if ($position) {
    $backgroundPosition = 'background-position: '.$position;
  }

  // Build a allowed list of cropformats
  foreach ($CROPPED_FORMAT as $key => $value) {
    array_push($imageformats,$key);
  }

  if ($image) {
    // Get Mime Type
    $imageMime = $image['mime_type'];

    // Check Imageformat
    if (in_array($format, $imageformats)) {
      // Generate Image Set
      if ($format == 'uncropped') {
        foreach (array_slice($UNCROPPED_SIZES, $offset) as $key => $value) {
          $imageset[] = $image['sizes']['rw_'.$key].' '.$value.'w';
        }
        // Define Preload Image
        $imagepre = $image['sizes']['rw_'.key(array_slice($UNCROPPED_SIZES, -1, true))];
      } else {
        foreach (array_slice($CROPPED_SIZES, $offset) as $key => $value) {
          $imageset[] = $image['sizes'][$format.'_'.$key].' '.$value.'w';
        }
        // Define Preload Image
        $imagepre = $image['sizes'][$format.'_'.key(array_slice($CROPPED_SIZES, -1, true))];
      }

      $imageset = implode(', ',$imageset);

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
      echo '<p style="color:red">Wrong Image Format ['.$format.']!<br> Use the Following: uncropped, wide, extrawide, square or rect </p>';
    }
  }
}

