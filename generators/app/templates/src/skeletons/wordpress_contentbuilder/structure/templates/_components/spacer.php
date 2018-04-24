<?php
/**
 * Spacer
 * ======
 * Spacer for adding more Margin
 */

// Default Vars
$classname = 'c-spacer';

$spacer = ' '.$classname.'--'.get_sub_field('spacer');
?>

<?php // Build Element Block ?>
<div class="<?= $classname.$spacer; ?>"></div>
