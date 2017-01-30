<?php
/**
  Page Header
  ===========
  Wrapper for Logo and Navigation
*/
?>

<header class="o-layout__header" role="banner">
  <div class="o-layout__container">
    <?php // Adding Page Logo ?>
    <?php include ( get_template_directory() . '/_components/pagelogo.php' ); ?>

    <?php // Adding Site Navigation ?>
    <?php include ( get_template_directory() . '/_components/mainnav.php' ); ?>
  </div>
</header>
