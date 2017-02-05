<?php
/**
 * Viewport Span
 * ==============
 * Container that overlaps the page border
 * Buggy on Windows Systems because the UI
 * will Calculate the Scrollbars in the Viewport Calculation
*/

// Default Vars
$classname = 'o-viewportspan';
?>

<?php // Build Element Block ?>
<div class="<?= $classname; ?><?= get_sub_field('style') ? ' '.$classname.'--s-'.get_sub_field('style') : ''; ?>"<?= get_sub_field('anchor') ? ' id="'.strtolower(get_sub_field('anchor')).'"' : '' ?>>
  <div class="<?= $classname; ?>__inner">
    <?php include ( get_template_directory() . '/_contentbuilder/contentModules.php' ); ?>
  </div>
</div>
