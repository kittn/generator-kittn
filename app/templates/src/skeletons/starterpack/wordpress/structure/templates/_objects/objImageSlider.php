<?php
/**
 * Image Slider
 * ============
 * Build a Image Slider with Swipper.js
 */

// Default Vars
$classname = 'o-imageslider';
?>

<? // Build Element Block ?>
<figure class="<?= $classname; ?>" itemscope itemtype="http://schema.org/ImageGallery" role="presentation">
  <div class="<?= $classname; ?>__wrapper">
    <?php while( have_rows('photos') ) : the_row(); ?>
      <div class="<?= $classname; ?>__slide" itemscope itemtype="http://schema.org/ImageObject">
        <?php macro_mediaImageSet(get_sub_field('photo'), $classname.'__image', get_sub_field('ratio')); ?>
      </div>
    <?php endwhile; ?>
  </div>
  <div class="<?= $classname; ?>__pagination"></div>
  <div class="<?= $classname; ?>__button-next"></div>
  <div class="<?= $classname; ?>__button-prev"></div>
</figure>
