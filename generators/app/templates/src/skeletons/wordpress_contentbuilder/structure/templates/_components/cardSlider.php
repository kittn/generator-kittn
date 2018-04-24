<?php
/**
 * Card Slider
 * ===========
 * Build a Card Slider with flickity
 */

// Default Vars
$classnameCardSlider = 'c-slider';
$ratio = get_sub_field('ratio');
$style = get_sub_field('style');
$slideCount = count( get_sub_field('slides') );

$responsive = get_sub_field('responsive') ? '-r' : '';
$spaceBetween = get_sub_field('spaceBetween') ? 'padding-left: '.get_sub_field('spaceBetween').';padding-right: '.get_sub_field('spaceBetween').';' : '';

switch (get_sub_field('slidesPerView')) :
  case 'auto':
    $slideWidth = ' '.$classnameCardSlider.'__slide'.$responsive.'--auto';
    break;
  case 'two':
    $slideWidth = ' '.$classnameCardSlider.'__slide'.$responsive.'--2';
    break;
  case 'three':
    $slideWidth = ' '.$classnameCardSlider.'__slide'.$responsive.'--3';
    break;
  case 'four':
    $slideWidth = ' '.$classnameCardSlider.'__slide'.$responsive.'--4';
    break;
  case 'five':
    $slideWidth = ' '.$classnameCardSlider.'__slide'.$responsive.'--5';
    break;
  case 'six':
    $slideWidth = ' '.$classnameCardSlider.'__slide'.$responsive.'--6';
    break;
  default:
    $slideWidth = ' '.$classnameCardSlider.'__slide'.$responsive.'--1';
    break;
endswitch;

// Autoplay Speed
switch (get_sub_field('autoplay')) :
  case 'slow' :
    $autoplay = 10000;
    break;
  case 'medium' :
    $autoplay = 5000;
    break;
  case 'fast' :
    $autoplay = 2500;
    break;
  default :
    $autoplay = 'false';
    break;
endswitch;

// Animation Speed and Friction
switch (get_sub_field('speed')) :
  case 'slow' :
    $selectedAttraction = 0.01;
    $friction = 0.15;
    break;
  case 'medium' :
    $selectedAttraction = 0.1;
    $friction = 0.35;
    break;
  case 'fast' :
    $selectedAttraction = 0.2;
    $friction = 1;
    break;
  default :
    $selectedAttraction = 0.025;
    $friction = 0.28;
    break;
endswitch;
?>

<?php // Build Element Block ?>
<figure class="<?= $classnameCardSlider; ?> js-imageSlider <?= $classnameCardSlider.'--card'; ?><?= $style != 'default' ? ' '.$classnameCardSlider.'--s-'.$style : '' ?>"
        role="presentation"
        itemscope itemtype="http://schema.org/MediaObject"
        data-flickity='{
    "accessibility": false,
    "contain": true,
    "imagesLoaded": true,
    "lazyLoad": false,
    "adaptiveHeight": <?= get_sub_field('autoheight') ? 'true' : 'false'; ?>,
    "groupCells": <?= get_sub_field('groupCell') != 'disable' ? get_sub_field('groupCell') : 0; ?>,
    "autoPlay": <?= $slideCount > 1 ? $autoplay : 'false' ?>,
    "draggable": <?= $slideCount > 1 ? 'true' : 'false' ?>,
    "friction": <?= $friction ?>,
    "selectedAttraction": <?= $selectedAttraction ?>,
    "freeScroll": <?= $slideCount > 1 && get_sub_field('freescroll') ? 'true' : 'false'; ?>,
    "freeScrollFriction": 0.03,
    "cellAlign": "<?= get_sub_field('slidePosition'); ?>",
    "prevNextButtons": <?= $slideCount > 1 && get_sub_field('navigation') != true ? 'true' : 'false'; ?>,
    "pageDots": <?= $slideCount > 1 && get_sub_field('pagination') != true ? 'true' : 'false'; ?>,
    "wrapAround": <?= $slideCount > 1 && get_sub_field('loop') ? 'true' : 'false'; ?>
  }'
>
  <?php while( have_rows('slides') ) : the_row(); ?>
    <div class="<?= $classnameCardSlider.'__slide'; ?><?= $slideWidth; ?>" style="<?= $spaceBetween ?>" itemscope itemtype="http://schema.org/ImageObject">
      <?php include ( get_template_directory() . '/_components/card.php' ); ?>
    </div>
  <?php endwhile; ?>
</figure>
