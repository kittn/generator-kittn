<?php
/**
 * Iframe Content
 * ==============
 * For adding responsive iFrame Content
 */

// Default Vars
$classname = 'o-iframecontent';

// Define Size Modifier
$mediaSize = (get_sub_field('size') != 'default' ? ' '.$classname.'--s-'.get_sub_field('size') : '');
// Ratio
$ratio = get_sub_field('ratio') ?: '16:9';
$r = explode(':', $ratio);

$style = get_sub_field('style');
?>

<?php // Build Element Block ?>
<div class="<?= $classname; ?><?= $mediaSize; ?><?= $style != 'default' ? ' '.$classname.'--s-'.$style : '' ?>" role="presentation">
  <?php if (get_sub_field('responsive')) : ?>
    <div class="<?= $classname.'__inner'; ?>" style="padding-bottom:<?= ($r[1] / $r[0]) * 100; ?>%">
      <?= get_sub_field('embed'); ?>
    </div>
  <?php else : ?>
    <div class="<?= $classname.'--align-'.get_sub_field('align'); ?>">
      <?= get_sub_field('embed'); ?>
    </div>
  <?php endif; ?>

  <?php if (get_sub_field('caption')) : ?>
    <div class="<?= $classname.'__caption'; ?>">{{ data.caption }}</div>
  <?php endif; ?>
</div>
