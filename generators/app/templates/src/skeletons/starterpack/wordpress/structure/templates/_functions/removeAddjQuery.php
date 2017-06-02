<?php
/**
  Remove jQuery Adding
  ====================
  Remove automated adding jQuery
*/

function dequeue_jquery_migrate( &$scripts){
  if(!is_admin()){
    $scripts->remove( 'jquery');
    $scripts->add( 'jquery', false, array( 'jquery-core' ) );
  }
}

add_filter( 'wp_default_scripts', 'dequeue_jquery_migrate' );
