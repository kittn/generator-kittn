<?php
/**
  Anchor
  ======
  Use Auto Scroll Lib
*/

// Default Vars
$classname = 'o-anchor';
?>

<?php // Build Element Block ?>
<div class="<?= $classname; ?>"
  id="<?= get_sub_field('anchorname') ? strtolower(get_sub_field('anchorname')) : 'anchor'; ?>"
  <?= get_sub_field('position') ? ' style="position:relative;top:'.get_sub_field('position').'"' : ''; ?>
  ></div>
