<?php
/**
 * Media Image
 * ===========
 * Image Container Element, can overlap Pageborder
 */

// Default Vars
$classname = 'c-mediaimage';

// Define Size Modifier
$style = (get_sub_field('size') != 'default' ? ' '.$classname.'--s-'.get_sub_field('style') : '');
// Set Hightrestiction
$mediaMaxHeight = (get_sub_field('heightrestriction') ? ' '.$classname.'--maxheight' : '');
?>

<?php // Building Element Block  ?>
<figure class="<?= $classname.$style.$mediaMaxHeight; ?>" role="group" itemscope itemtype="http://schema.org/ImageObject">
  <?php macro_mediaImageSet(get_sub_field('photo'), $classname.'__image', get_sub_field('ratio')); ?>
  <?php if (get_sub_field('caption')) : ?>
    <figcaption class="<?= $classname.'__caption'; ?>" itemprop="caption description">
      <?= get_sub_field('caption'); ?>
    </figcaption>
  <?php endif; ?>
</figure>
