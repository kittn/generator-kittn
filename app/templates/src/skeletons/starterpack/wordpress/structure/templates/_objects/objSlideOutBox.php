<?php
/**
  Slide Out Box
  =============
  Use Auto Scroll Lib
*/

// Default Vars
$classname = 'o-slideoutbox';
?>

<?php // Build Element Block ?>
<div class="<?= $classname; ?><?= get_sub_field('style') != 'default' ? ' '.$classname.'--'.get_sub_field('style') : ''; ?>">
  <div class="<?= $classname; ?>__head">
    <div class="<?= $classname; ?>__trigger"><?= get_sub_field('trigger'); ?></div>
  </div>
  <div class="<?= $classname; ?>__body">
    <div class="<?= $classname; ?>__body__inner"><?= get_sub_field('body'); ?></div>
  </div>
</div>
