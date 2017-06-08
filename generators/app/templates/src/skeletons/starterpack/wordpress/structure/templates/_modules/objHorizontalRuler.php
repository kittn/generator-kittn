<?php
/**
 * Horizontal Ruler
 * ================
 * Simple horizontal Ruler
 */

// Default Vars
$classname = 'o-horizontalruler';
?>

<?php // Build Element Block ?>
<hr class="<?= $classname; ?><?= get_sub_field('horizontal_ruler') != 'default' ? '---'.get_sub_field('horizontal_ruler') : ''; ?>" role="seperator">
