<?php
/**
  Media Image
  ===========
  Image Container Element, can overlap Pageborder

*/

// Default Vars
$classname = 'o-mediaimage';
$mediaSize = '';
$mediaMaxHeight = '';

// Define Size Modifier
switch (get_sub_field('size')) :
  case 'viewportsize' :
    $mediaSize = ' '.$classname.'--s-viewportsize';
    break;
  case 'oversize' :
    $mediaSize = ' '.$classname.'--s-oversize';
    break;
  case 'undersize' :
    $mediaSize = ' '.$classname.'--s-undersize';
    break;
endswitch;

// Set Hightrestiction
if (get_sub_field('heightrestriction'))
  $mediaMaxHeight = ' '.$classname.'--maxheight';

$ratio = get_sub_field('ratio');

$classes = $classname.$mediaSize.$mediaMaxHeight;
?>

<?php // Building Element Block  ?>
<figure class="<?= $classes; ?>" role="group" itemscope itemtype="http://schema.org/ImageObject">
  <?php macro_mediaImageSet(get_sub_field('photo'), $classname.'__image', $ratio); ?>
  <?php if (get_sub_field('caption')) : ?>
    <figcaption class="<?= $classname; ?>__caption" itemprop="caption description">
      <?= get_sub_field('caption'); ?>
    </figcaption>
  <?php endif; ?>
</figure>
