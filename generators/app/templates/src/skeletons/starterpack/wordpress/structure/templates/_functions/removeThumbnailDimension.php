<?php
/**
  Remove Thumbnail Dimensions
  ===========================
  Remove thumbnail width and height dimensions that prevent fluid images in the_thumbnail
*/

function remove_thumbnail_dimensions($html){
  $html = preg_replace('/(width|height)=\"\d*\"\s/', "", $html);
  return $html;
}
