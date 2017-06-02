<?php
  // Custom loading image
  add_filter('wpcf7_ajax_loader', 'my_wpcf7_ajax_loader');
  function my_wpcf7_ajax_loader () {
    return  get_bloginfo('stylesheet_directory') . '/assets/images/progress.gif';
  }
?>