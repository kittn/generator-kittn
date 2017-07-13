<?php
/**
 * Button
 * ======
 * Creates a button with different styles. In addition, size, width and position can be adjusted.
 */

// Default Vars
$classname = 'c-button';
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
  $buttonlink = 'history.back();';
} else {
  $buttonlink = get_sub_field('link')['url'];
}
?>

<?php // Build Element Block ?>
<div class="<?= $classname ?><?= $buttonposition ?>">
  <a itemprop="url"
     role="button"
     href="<?= $buttonlink ?>"
     <?php if ( get_sub_field('link')['target'] == 1 ) : ?>target="_blank"<?php endif; ?>
     class="<?= $classname ?>__element<?= $buttonstyle.$buttonsize.$buttonfullwidth; ?>">
    <?= get_sub_field('link')['title'] ? get_sub_field('link')['title'] : __('Link', 'kittn')  ?>
  </a>
</div>
