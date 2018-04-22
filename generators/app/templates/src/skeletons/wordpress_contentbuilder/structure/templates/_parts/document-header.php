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
  <title><?php wp_title(''); ?><?php if(wp_title('', false)) { echo ': '; } ?><?php bloginfo('name'); ?></title>
  <link rel="profile" href="http://gmpg.org/xfn/11">
  <link rel="stylesheet" href="<?= get_template_directory_uri(); ?>/assets/css/style.css">
  <link rel="shortcut icon" href="<?= get_template_directory_uri(); ?>/assets/system/favicon.png">
  <?php wp_head(); ?>
  <?php if (WP_ENV != 'local') : ?>
    <script>document.getElementsByTagName('html')[0].classList.add('plj')</script>
  <?php endif; ?>
</head>
