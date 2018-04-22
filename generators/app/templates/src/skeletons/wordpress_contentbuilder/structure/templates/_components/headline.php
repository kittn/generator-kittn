<?php
/**
 * Headline Module
 * ===============
 * Build a semantic Headline with an optional visual overwrite
 */

// Default Vars
$classname = 'c-headline';
// Getting Vars
$size = get_sub_field('size');
$visSize = get_sub_field('overwrite');
$style = get_sub_field('style');
?>

<?php // Build Element Block ?>
<<?= $size; ?> class="<?= $classname ?><?= $visSize != 'default' ? ' '.$visSize : '' ?><?= $style != 'default' ? ' '.$classname.'--s-'.$style : '' ?>" role="heading" itemprop="name"><span><?php the_sub_field('headline'); ?></span></<?= $size; ?>>
