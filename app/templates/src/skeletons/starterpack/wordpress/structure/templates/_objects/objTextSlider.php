<?php
/**
 * Text Slider
 * ===========
 * Build a Text Slider with Swipper
 */

// Default Vars
$classname = 'o-textslider';
$style = get_sub_field('style');
?>

<? // Build Element Block ?>
<figure class="<?= $classname; ?><?= $style != 'default' ? ' '.$classname.'--s-'.$style : '' ?>" role="presentation">
  <div class="<?= $classname; ?>__wrapper">
    <?php while( have_rows('slides') ) : the_row(); ?>
      <div class="<?= $classname; ?>__slide">
        <?= get_sub_field('slide'); ?>
      </div>
    <?php endwhile; ?>
  </div>
  <div class="<?= $classname; ?>__pagination"></div>
  <div class="<?= $classname; ?>__button-next"></div>
  <div class="<?= $classname; ?>__button-prev"></div>
</figure>
