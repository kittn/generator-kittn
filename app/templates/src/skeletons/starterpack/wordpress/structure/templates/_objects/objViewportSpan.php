<?php
/**
 * Viewport Span
 * ==============
 * The Viewportspan, the regular PageBorder can overlap the viewport margin.
 * This is somewhat flawed on window systems (the scrollbar is placed on the
 * window system in the viewport). Alternatively, the viewportspan
 * can be used as a regular container.
*/

// Default Vars
$classname = 'o-viewportspan';
?>

<?php // Build Element Block ?>
<div class="<?= $classname; ?><?= get_sub_field('container') ? ' '.$classname.'--ascontainer' : ' '.$classname.'--asspan'; ?><?= get_sub_field('style') ? ' '.$classname.'--s-'.get_sub_field('style') : ''; ?>"<?= get_sub_field('anchor') ? ' id="'.strtolower(get_sub_field('anchor')).'"' : '' ?>>
  <div class="<?= $classname; ?>__inner">
    <?php include ( get_template_directory() . '/_contentbuilder/contentModules.php' ); ?>
  </div>
</div>
