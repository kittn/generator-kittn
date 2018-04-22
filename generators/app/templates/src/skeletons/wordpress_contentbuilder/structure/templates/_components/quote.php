<?php
/**
 * Quote Module
 * ============
 * Simple Quote module with Cite for displaying the source
 */

// Default Vars
$classname = 'c-quote';
$style = get_sub_field('style');
?>

<?php // Building Element Block ?>
<blockquote class="<?= $classname; ?><?= $style != 'default' ? ' '.$classname.'--s-'.$style : '' ?>">
  <?= get_sub_field('quote'); ?>
  <?php if (get_sub_field('source')) : ?><cite class="<?= $classname.'__cite' ?>"> <?= get_sub_field('source'); ?> </cite><?php endif; ?>
</blockquote>
