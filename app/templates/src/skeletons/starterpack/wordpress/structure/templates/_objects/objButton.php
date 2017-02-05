<?php
/**
 * Button Module
 * =============
 * Build a simple Button Element with an outer position Wrapper
 */

// Default Vars
$classname = 'o-button';
$buttonlink = '';

// Positon Modifiers
$buttonposition = (get_sub_field('position') != 'default' ? ' '.$classname.'--'.get_sub_field('position') : '');
// Style Modifiers
$buttonstyle = (get_sub_field('style') ? ' '.$classname.'--s-'.get_sub_field('style') : '');
// Size Modifier
$buttonsize = (get_sub_field('size') ? ' '.$classname.'--'.get_sub_field('size') : '');
// Fullwidth Modifier
$buttonfullwidth = (get_sub_field('fullwidth') ? ' '.$classname.'--fullwidth' : '');
// Button Target
if (get_sub_field('backbutton')) {
  $buttonlink = ' href="history.back();" ';
} else {
  if (get_sub_field('external')) {
    $buttonlink = ' href="'.get_sub_field('external_link').'" target="_blank" ';
  } else {
    $buttonlink = ' href="'.get_sub_field('internal_link').'"';
  }
}
?>

<?php // Build Element Block ?>
<div class="<?= $classname; ?><?= $buttonposition; ?>">
  <a itemprop="url" role="button" <?= $buttonlink; ?>
     class="<?= $classname; ?>__element<?= $buttonstyle.$buttonsize.$buttonfullwidth; ?>">
    <?= get_sub_field('label'); ?>
  </a>
</div>
