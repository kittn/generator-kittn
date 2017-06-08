<?php
/**
  Client Logo
  ===========
  Add a Custom Client Logo to wp-login
*/

function client_admin_logo() { ?>
  <style type="text/css">
    body.login div#login h1 a {
      background-image: url(<?php echo get_stylesheet_directory_uri(); ?>/assets/img/svgfiles/wp-logo.svg);
      padding-bottom: 10px;
    }
  </style>
<?php }
