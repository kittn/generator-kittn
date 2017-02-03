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
 */
function macro_mediaImageSet($image,$classname,$format,$background = false) {
  $imageset = '';
  $imagepre = '';
  $imageformats = ['uncropped', 'wide', 'extrawide', 'square', 'rect'];

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
    // Check Imageformat
    if (in_array($format, $imageformats)) {
      // Generate Image Set
      foreach (($format != 'uncropped' ? $cropsizes : $imagesizes) as $key => $value) {
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
        echo '<figure class="'.$classname.' lazyload" style="background-image: url('.$imagepre.')" data-sizes="auto" data-bgset="'.$imageset.'"></figure>';
      } else {
        echo '<img data-sizes="auto" src="'.$imagepre.'" data-srcset="'.$imageset.'" class="'.$classname.' lazyload" role="img" alt="'.$image["alt"].'" itemprop="thumbnail">';
      }
    } else {
      echo '<p style="color:red">Wrong Image Format!<br> Use the Following: uncropped, wide, extrawide, square or rect </p>';
    }
  }
}
