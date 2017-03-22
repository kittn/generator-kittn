<?php
/**
  Shortcodes
  ============
  A Shortcodes Collection
*/

// Define Shortcodes
function shortcode_demo($atts , $content = null) {
  // Attributes
  extract( shortcode_atts(
    array(
      'attribute' => ''
    ), $atts )
  );

  // Internal Logic

  // Output
  return '';
}

// Adding Shortcodes
add_shortcode( 'demo', 'shortcode_demo' );
