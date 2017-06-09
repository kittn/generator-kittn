<?php
/**
  Allow SVG
  ============
  Add a RSS Link to the Header
*/

function allow_svg( $svg_mime ){
  $svg_mime['svg'] = 'image/svg+xml';
  return $svg_mime;
}

add_filter( 'upload_mimes', 'allow_svg' );
