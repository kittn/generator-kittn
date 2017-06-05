<?php
/**
  Disable REST
  ============
  Disable REST API
*/

add_filter('json_enabled', '__return_false');
add_filter('json_jsonp_enabled', '__return_false');
