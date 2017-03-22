<?php
/**
  Remove WP Generator
  ===================
  Remove WP Generator notify from Header
*/

remove_action('wp_head', 'wp_generator');
