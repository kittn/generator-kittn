<?php
/**
 * Section
 * =========
 * Subsegment of a content module, when the page wrapper is removed the section can run over the full browser width.
 */

// Default Vars
$classnameSection = 'c-grid';
$anchor = get_sub_field('anchor') ? ' id="'.get_sub_field('anchor').'"' : '';
$innerContainer = get_sub_field('innerContainer') != 'default' ? ' c-grid__container--'.get_sub_field('innerContainer') : '';
$backgroundContainer = get_sub_field('innerContainer') ? ' c-grid__bg--size-'.get_sub_field('innerContainer') : '';
$gridLayoutClass = get_sub_field('gridLayout') ? ' '.get_sub_field('gridLayout') : '';
$gridLayoutType = get_sub_field('gridType');
$gridOldRevision = get_sub_field('oldSpec');
?>

<?php // Build Element Block ?>
<section class="c-grid fullbleed <?= get_sub_field('style') ? ' '.get_sub_field('style') : '' ?>"<?= $anchor;?>>

  <?php if (get_sub_field('backgroundImage')) : ?>
    <div class="c-grid__bg<?= get_sub_field('bgStyle') ? ' '.get_sub_field('bgStyle') : '' ?><?= get_sub_field('adaptContainer') ? $backgroundContainer : '' ?>">
      <div class="c-grid__bg__container c-grid__bg__container--<?= get_sub_field('width')?>">
        <div
          <?= macro_mediaImageSet(get_sub_field('backgroundImage'),'c-grid__bg__background',get_sub_field('ratio'),true, false,get_sub_field('position')); ?>
        ></div>
      </div>
    </div>
  <?php endif; ?>

  <div class="c-grid__container container<?= $innerContainer; ?><?= $gridLayoutClass ?>">
    <?php $count = 0; ?>
    <?php while( have_rows('box') ) : the_row(); ?>
      <?php
      $clStyle = get_sub_field('style') ? ' '.get_sub_field('style') : '';

      $gridArea = '';
      $gridBoxClassName = '';
      $boxName = get_sub_field('boxName') ? get_sub_field('boxName') : null;

      if ($gridLayoutType == 'cssgrid') {
        if ($gridOldRevision) {
          if ($boxName != '') {
            $gridBoxClassName = $gridLayoutClass.'__'.$boxName;
          } else {
            $gridBoxClassName = $gridLayoutClass.'__box-'.$count;
          }

        } else {
          $gridBoxClassName = $gridLayoutClass.'__box';
          $gridArea = $boxName != '' ? ' style="grid-area:'.$boxName.'"' : ' style="grid-area:box-'.$count.'"';
        }

      } else {
        if ($gridLayoutClass != '') {
          $gridBoxClassName = $boxName != null ? $gridLayoutClass.'__'.$boxName : '';
        }
      }
      $gridBoxClassName = ' '.$gridBoxClassName;
      ?>
      <div class="c-grid__box<?= $gridBoxClassName ?><?= $clStyle; ?>"<?= $gridArea ?>>
        <?php include ( get_template_directory() . '/_contentbuilder/contentModules.php' ); ?>
      </div>
    <?php $count++ ?>
    <?php endwhile; ?>
  </div>
</section>
