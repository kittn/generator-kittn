<?php
/**
 * Iframe Content
 * ==============
 * For adding responsive iFrame Content
 */

// Default Vars
$classname = 'c-iframecontent';

// Define Size Modifier
$mediaSize = (get_sub_field('size') != 'default' ? ' '.$classname.'--s-'.get_sub_field('size') : '');
// Ratio
$ratio = get_sub_field('ratio') ?: '16:9';
$r = explode(':', $ratio);

$style = get_sub_field('style');
?>

<?php // Build Element Block ?>
<div class="<?= $classname; ?><?= $mediaSize; ?><?= $style != 'default' ? ' '.$classname.'--s-'.$style : '' ?><?= ' '.$classname.'--align-'.get_sub_field('align'); ?>" role="presentation">
    <div class="<?= $classname?><?= get_sub_field('responsive') ? '__inner' : '__wrapper' ?>"<?php if (get_sub_field('responsive')) : ?> style="padding-bottom:<?= ($r[1] / $r[0]) * 100; ?>%"<?php endif; ?>>
      <?= get_sub_field('embed') ?>
    </div>
  <?php if (get_sub_field('caption')) : ?>
    <div class="<?= $classname.'__caption' ?>"><?= get_sub_field('caption') ?></div>
  <?php endif; ?>
</div>
