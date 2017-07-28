<?php
/**
  Image Sizes
  ===========
  Build a Set of different Imagesets
 */

// Uncopped Image Sizes
$UNCROPPED_SIZES = array(
  'xlarge'  => '1900',
  'large'   => '1400',
  'wide'    => '1200',
  'desktop' => '960',
  'tablet'  => '768',
  'medium'  => '480',
  'small'   => '320',
  'micro'   => '150'
);

// Cropped Image Sizes
$CROPPED_SIZES = array(
  'xlarge' => '1900',
  'large'  => '1200',
  'medium' => '800',
  'small'  => '400',
  'mini'   => '100'
);

// Different Formats with different ratios (insert the Result of Ratio hight/width)
$CROPPED_FORMAT = array(
  'square'    => '1',      // 1:1
  'wide'      => '0.5625', // 16:9
  'extrawide' => '0.4761', // 21:10
  'rect'      => '0.75'    // 4:3
);

// Basic Images Crops
add_image_size('mini', 100);
add_image_size('small', 600);
add_image_size('medium', 1000);
add_image_size('large', 1280);

// Generate Uncropped Images
foreach ($UNCROPPED_SIZES as $key => $value) {
  add_image_size('rw_'.$key,  $value, 9999);
}

// Generate Crop Sets
foreach ($CROPPED_FORMAT as $type => $ratio) {
  // Generate Crop Sizes
  foreach ($CROPPED_SIZES as $key => $value) {
    $height = $value * $ratio;
    add_image_size($type.'_'.$key, $value, $height, true);
  }
}
