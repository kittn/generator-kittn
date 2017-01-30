<?php
/**
  Image Slider
  ===============
  Build a Image Slider with Swipper
*/

// Default Vars
$classname = 'o-imageslider';

// Get general Image Ratio
$ratio = get_sub_field('ratio');

?>

<? // Build Element Block ?>
<figure class="<?= $classname; ?>">
  <div class="<?= $classname; ?>__wrapper">
    <?php while( have_rows('photos') ) : the_row(); ?>
      <div class="<?= $classname; ?>__slide">
        <?php macro_mediaImageSet(get_sub_field('photo'), $classname.'__image', $ratio); ?>
      </div>
    <?php endwhile; ?>
  </div>
  <div class="<?= $classname; ?>__pagination"></div>
  <div class="<?= $classname; ?>__button-next"></div>
  <div class="<?= $classname; ?>__button-prev"></div>
</figure>
