<?php
/**
 * Spacer
 * ======
 * Spacer for adding more Margin
 */

// Default Vars
$classname = 'o-spacer';

$spacer = ' '.$classname.'--'.get_sub_field('spacer');
?>

<?php // Build Element Block ?>
<div class="<?= $classname.$spacer; ?>"></div>
