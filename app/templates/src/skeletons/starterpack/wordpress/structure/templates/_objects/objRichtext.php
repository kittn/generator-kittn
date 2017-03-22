<?php
/**
*  Richtext Module
*  ===============
*  Output Richtext Content
*/

// Default Vars
$classname = 'o-richtext';
$style = get_sub_field('style');
?>

<?php // Build Element Block ?>
<div class="<?= $classname; ?><?= $style != 'default' ? ' '.$classname.'--s-'.$style : '' ?>">
  <?= get_sub_field('richtext'); ?>
</div>
