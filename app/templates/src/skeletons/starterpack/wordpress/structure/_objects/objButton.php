<?php
/**
  Button Module
  =============
  Build a simple Button Element with an outer position Wrapper
*/

// Default Vars
$classname = 'o-button';
$buttonposition = '';
$buttonstyle = '';
$buttonsize = '';
$buttonfullwidth = '';
$buttonlink = '';

// Positon Modifiers
switch (get_sub_field('position')) :
  case 'right' :
    $buttonposition = ' '.$classname.'--right';
    break;
  case 'center' :
    $buttonposition = ' '.$classname.'--center';
    break;
endswitch;

// Style Modifiers
switch (get_sub_field('style')) :
  case 'style1' :
    $buttonstyle = ' '.$classname.'--s-style1';
    break;
  case 'default' :
    $buttonstyle = ' '.$classname.'--s-default';
    break;
endswitch;

// Size Modifier
if (get_sub_field('size'))
  $buttonsize = ' '.$classname.'--'.get_sub_field('size');

// Fullwidth Modifier
if (get_sub_field('fullwidth'))
  $buttonfullwidth = ' '.$classname.'--fullwidth';

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
  <a itemprop="url"<?= $buttonlink; ?>
     class="<?= $classname; ?>__element<?= $buttonstyle.$buttonsize.$buttonfullwidth; ?>">
    <?= get_sub_field('label'); ?>
  </a>
</div>
