<?php
/**
  Navigations
  ===========
  Register Navigation Meneus
*/

function register_my_menus() {
  register_nav_menus(
    array(
      'mainnav'   => __('Main Navigation'),
      'footernav' => __('Footer Navigation')
    )
  );
}

add_action( 'init', 'register_my_menus' );
