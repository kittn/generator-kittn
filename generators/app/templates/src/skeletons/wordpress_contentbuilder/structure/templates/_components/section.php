<?php
/**
 * Section
 * =========
 * Subsegment of a content module, when the page wrapper is removed the section can run over the full browser width.
 */

// Default Vars
$classnameSection = 'c-section';
$style = get_sub_field('style');
$fullheight = get_sub_field('fullheight') ? ' '.$classnameSection.'--fullheight' : '';
$anchor = get_sub_field('anchor') ? ' id="'.get_sub_field('anchor').'"' : '';
$innerContainer = get_sub_field('innerContainer') != 'default' ? ' '.$classnameSection.'__container--'.get_sub_field('innerContainer') : '';
$backgroundContainer = get_sub_field('innerContainer') ? ' '.$classnameSection.'__bg--size-'.get_sub_field('innerContainer') : '';

$count = count(get_sub_field('column'));
$columnLayout = '';
$cl = '--cl-1';
switch ($count) :
  case '2' :
    $cl = '--cl-'.get_sub_field('twoColumns');
    break;
  case '3' :
    $cl = '--cl-'.get_sub_field('threeColumns');
    break;
  case '4' :
    $cl = '--cl-'.get_sub_field('fourColumns');
    break;
endswitch;
?>

<?php // Build Element Block ?>
<section class="<?= $classnameSection; ?><?= $fullheight; ?><?= $style ? ' '.$classnameSection.'--s-'.$style : '' ?>"<?= $anchor;?>>

  <?php if (get_sub_field('backgroundImage')) : ?>
    <div class="<?= $classnameSection; ?>__bg<?= get_sub_field('behavior') != 'default' ? ' '.$classnameSection.'__bg--'.get_sub_field('behavior') :  '' ?> <?= $classnameSection; ?>--p-<?= get_sub_field('align') ?><?= get_sub_field('adaptContainer') ? $backgroundContainer : '' ?>">
      <div class="<?= $classnameSection; ?>__bg__container <?= $classnameSection ?>__bg__container--size-<?= get_sub_field('width')?>">
        <div
          <?= macro_mediaImageSet(get_sub_field('backgroundImage'),$classnameSection.'__bg__background',get_sub_field('ratio'),true, false,get_sub_field('position')); ?>
        ></div>
      </div>
    </div>
  <?php endif; ?>

  <div class="<?= $classnameSection.'__container'; ?><?= $innerContainer; ?>">
    <div class="<?= $classnameSection.'__row'; ?> <?= $classnameSection.'__row--child-'.$count; ?>">
      <?php while( have_rows('column') ) : the_row(); ?>
        <?php
        $clStyle = get_sub_field('style') != 'default' ? ' '.$classnameSection.'__column--'.get_sub_field('style') : '';
        $clAlign = get_sub_field('align') != 'default' ? ' '.$classnameSection.'__inner--align-'.get_sub_field('align') : '';
        $clVerticalAlign = get_sub_field('verticalAlign') != 'default' ? ' '.$classnameSection.'__inner--valign-'.get_sub_field('verticalAlign') : '';
        ?>
        <div class="<?= $classnameSection.'__column'; ?> <?= $classnameSection.'__column'.$cl; ?><?= $clStyle; ?>">
          <div class="<?= $classnameSection.'__inner'; ?><?= $clAlign; ?><?= $clVerticalAlign; ?>">
            <?php include ( get_template_directory() . '/_contentbuilder/contentModules.php' ); ?>
          </div>
        </div>
      <?php endwhile; ?>
    </div>
  </div>
</section>
