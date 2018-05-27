<?php
/**
*  Richtext Module
*  ===============
*  Output Richtext Content
*/

// Default Vars
$classname = 'o-richtext';
?>

<?php // Build Element Block ?>
<div class="<?= $classname; ?><?= get_sub_field('style') ? ' '.get_sub_field('style') : '' ?>">
  <?= get_sub_field('richtext'); ?>
</div>
