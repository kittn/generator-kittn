<?php
/**
  Image Sizes
  ===========
  A Set of Image Sizes
*/

// Images
add_image_size('mini', 100);
add_image_size('small', 600);
add_image_size('medium', 1000);
add_image_size('large', 1280);

add_image_size('rw_large',  1400, 9999);
add_image_size('rw_wide',   1200, 9999);
add_image_size('rw_desktop', 960, 9999);
add_image_size('rw_tablet',  768, 9999);
add_image_size('rw_medium',  480, 9999);
add_image_size('rw_small',   320, 9999);
add_image_size('rw_micro',   150, 9999);

// Square Crops - needed for Gallery
add_image_size('square_large', 1200, 1200, true);
add_image_size('square_medium', 800, 800, true);
add_image_size('square_small', 400, 400, true);
add_image_size('square_mini', 100, 100, true);

// Wide Crops (16:9) - needed for Gallery
add_image_size('wide_large', 1200, 675, true);
add_image_size('wide_medium', 800, 450, true);
add_image_size('wide_small', 400, 225, true);
add_image_size('wide_mini', 100, 56, true);

// Wide Crops (21:10) - needed for Gallery
add_image_size('extrawide_large', 1200, 514, true);
add_image_size('extrawide_medium', 800, 343, true);
add_image_size('extrawide_small', 400, 171, true);
add_image_size('extrawide_mini', 100, 43, true);

// Wide Crops (4:3) - needed for Gallery
add_image_size('rect_large', 1200, 900, true);
add_image_size('rect_medium', 800, 600, true);
add_image_size('rect_small', 400, 300, true);
add_image_size('rect_mini', 100, 75, true);
