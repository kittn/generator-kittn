<?php
/**
  Remove AdminBar
  ===============
  Remove Adminbar from Frontend
*/

add_filter('show_admin_bar', '__return_false');
