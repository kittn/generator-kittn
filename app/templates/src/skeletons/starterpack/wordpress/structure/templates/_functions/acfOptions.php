<?php
/**
  ACF Option
  ==========
  Add a ACF Option Page
*/

if( function_exists('acf_add_options_page') ) {
  acf_add_options_page();
  acf_add_options_sub_page('Homepage');
  acf_add_options_sub_page('Globals');
}


