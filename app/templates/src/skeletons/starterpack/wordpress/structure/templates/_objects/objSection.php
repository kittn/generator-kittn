<?php
/**
 * Section
 * =========
 * Subsegment of a content module, when the page wrapper is removed the section can run over the full browser width.
 */

// Default Vars
$classnameSection = 'o-section';
$style = get_sub_field('style');
$fullheight = get_sub_field('fullheight') ? ' '.$classnameSection.'--fullheight' : '';
$anchor = get_sub_field('anchor') ? ' id="'.get_sub_field('anchor').'"' : '';
$innerContainer = get_sub_field('innerContainer') != 'default' ? ' '.$classnameSection.'__container--'.get_sub_field('innerContainer') : '';

$count = count(get_sub_field('column'));
$columnLayout = '';
switch ($count) :
  case '2' :
    $columnLayout = get_sub_field('twoColumns') != 'default' ?  ' '.$classnameSection.'__row--cl-'.get_sub_field('twoColumns') : '';
    break;
  case '3' :
    $columnLayout = get_sub_field('threeColumns') != 'default' ? ' '.$classnameSection.'__row--cl-'.get_sub_field('threeColumns') : '';
    break;
  case '4' :
    $columnLayout = get_sub_field('fourColumns') != 'default' ? ' '.$classnameSection.'__row--cl-'.get_sub_field('fourColumns') : '';
    break;
endswitch;
?>

<?php // Build Element Block ?>




<section class="<?= $classnameSection; ?><?= $fullheight; ?><?= $style != 'default' ? ' '.$classnameSection.'--s-'.$style : '' ?>"<?= $anchor;?>>
  <div class="<?= $classnameSection; ?>__container<?= $innerContainer; ?>">
    <div class="<?= $classnameSection; ?>__row <?= $classnameSection.'__row--child-'.$count; ?><?= $columnLayout; ?>">
      <?php while( have_rows('column') ) : the_row(); ?>
        <?php
        $clStyle = get_sub_field('style') != 'default' ? ' '.$classnameSection.'__column--'.get_sub_field('style') : '';
        $clAlign = get_sub_field('align') != 'default' ? ' '.$classnameSection.'__inner--align-'.get_sub_field('align') : '';
        $clVerticalAlign = get_sub_field('verticalAlign') != 'default' ? ' '.$classnameSection.'__inner--valign-'.get_sub_field('verticalAlign') : '';
        ?>
        <div class="<?= $classnameSection; ?>__column<?= $clStyle; ?>">
          <div class="<?= $classnameSection; ?>__inner<?= $clAlign; ?><?= $clVerticalAlign; ?>">
            <?php include ( get_template_directory() . '/_contentbuilder/contentModules.php' ); ?>
          </div>
        </div>
      <?php endwhile; ?>
    </div>
  </div>
</section>
