<?php
/**
 * Image Slider
 * ============
 * Build a Image Slider with Swipper.js
 */

// Default Vars
$classname = 'o-imageslider';
$ratio = get_sub_field('ratio');
$style = get_sub_field('style');
?>

<? // Build Element Block ?>
<figure class="<?= $classname; ?><?= $style != 'default' ? ' '.$classname.'--s-'.$style : '' ?>" itemscope itemtype="http://schema.org/ImageGallery" role="presentation">
  <div class="<?= $classname; ?>__wrapper">
    <?php while( have_rows('photos') ) : the_row(); ?>
      <div class="<?= $classname; ?>__slide" itemscope itemtype="http://schema.org/ImageObject">
        <?php macro_mediaImageSet(get_sub_field('photo'), $classname.'__image', $ratio); ?>
      </div>
    <?php endwhile; ?>
  </div>
  <div class="<?= $classname; ?>__pagination"></div>
  <div class="<?= $classname; ?>__button-next"></div>
  <div class="<?= $classname; ?>__button-prev"></div>
</figure>
