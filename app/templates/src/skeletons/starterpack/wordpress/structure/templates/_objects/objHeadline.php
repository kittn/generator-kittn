<?php
/**
 * Headline Module
 * ===============
 * Build a semantic Headline with an optional visual overwrite
 */

// Default Vars
$classname = 'o-headline';
// Getting Vars
$size = get_sub_field('size');
$visSize = get_sub_field('overwrite');
$style = get_sub_field('style');
?>

<?php // Build Element Block ?>
<<?= $size; ?> class="<?= $classname ?><?= $visSize != 'default' ? ' '.$visSize : '' ?><?= $style != 'default' ? ' '.$classname.'--s-'.$style : '' ?>" role="heading" itemprop="name"><?php the_sub_field('headline'); ?></<?= $size; ?>>
