<!DOCTYPE html>
<html <?php language_attributes(); ?>>
<?php // Include Head ?>
<?php include ( get_template_directory() . '/_parts/document-header.php' ); ?>
<body <?php body_class(); ?>>
  <?php if (WP_ENV != 'local') : ?>
  <div class="o-progressloader">
    <div class="o-progressloader__loader"></div>
  </div>
  <?php endif; ?>
  <div class="o-layout__wrapper">
    <?php // Include Pageheader ?>
    <?php include ( get_template_directory() . '/_parts/page-header.php' ); ?>
