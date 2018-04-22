<?php
/**
 * Jumpnavigation
 * ==============
 * Used for Jumping to Anchors
 */

// Default Vars
$classname = 'c-jumpnavigation';

// Layouttype
$navlayout = (get_sub_field('layout') != 'default' ? ' '.$classname.'--l-'.get_sub_field('layout') : '');
?>

<?php // Build Element Block ?>
<nav class="<?= $classname; ?><?= get_sub_field('style') != 'default' ? ' '.$classname.'--s-'.get_sub_field('style') : ''; ?><?= $navlayout; ?>" role="navigation" itemscope itemtype="http://schema.org/SiteNavigationElement">
  <?php while( have_rows('anchor') ) : the_row(); ?>
    <a itemprop="url" role="button" href="#<?= strtolower(get_sub_field('anchorname')); ?>" class="<?= $classname.'__link'; ?> js-smooth-scroll"><?= get_sub_field('linkname'); ?></a>
  <?php endwhile; ?>
</nav>
