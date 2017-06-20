<?php
/**
 * Anchor
 * ======
 * Creates the anchor points for jump navigations.
 * Do not use special characters for the anchor points.
 * The jump position can be adjusted vertically with the override.
 */

// Default Vars
$classname = 'o-anchor';
?>

<?php // Build Element Block ?>
<div class="<?= $classname; ?>"
  id="<?= get_sub_field('anchorname') ? strtolower(get_sub_field('anchorname')) : 'anchor'; ?>"
  <?= get_sub_field('position') ? ' style="position:relative;top:'.get_sub_field('position').'"' : ''; ?>
  ></div>
