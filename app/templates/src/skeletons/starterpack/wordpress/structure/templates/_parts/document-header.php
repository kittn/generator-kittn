<?php
/**
  Document Header
  ===============
  HTML Header for Meta, Script and CSS Loading

*/
?>
<head>
  <meta charset="<?php bloginfo( 'charset' ); ?>">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title><?php wp_title( '|', true, 'right' ); ?></title>
  <?php if (WP_ENV !== 'productive') : ?>
  <meta name="robots" content="noindex,nofollow"/>
  <?php endif; ?>
  <link rel="profile" href="http://gmpg.org/xfn/11">
  <link rel="stylesheet" href="<?= get_template_directory_uri(); ?>/assets/css/style.css">
  <link rel="shortcut icon" href="<?= get_template_directory_uri(); ?>/assets/system/favicon.png">
  <?php wp_head(); ?>
  <!--[if lt IE 9]>
  <script src="<?php bloginfo('template_url'); ?>/assets/js/html5shiv.js"></script>
  <![endif]-->
  <script>document.getElementsByTagName('html')[0].classList.add('plj')</script>
</head>
