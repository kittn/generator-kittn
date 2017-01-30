<?php
/**
  Jumpnavigation
  ==============
  Used for Jumping to Anchors
*/

// Default Vars
$classname = 'o-jumpnavigation';
$navlayout = '';

switch (get_sub_field('layout')) :
  case 'fullwidth' :
    $navlayout = ' '.$classname.'--l-fullwidth';
    break;
  case 'list' :
    $navlayout = ' '.$classname.'--l-list';
    break;
endswitch;
?>

<?php // Build Element Block ?>
<nav class="<?= $classname; ?><?= get_sub_field('style') != 'default' ? ' '.$classname.'--s-'.get_sub_field('style') : ''; ?><?= $navlayout; ?>">
  <?php while( have_rows('anchor') ) : the_row(); ?>
    <a href="#<?= strtolower(get_sub_field('anchorname')); ?>" class="<?= $classname; ?>__link js-smooth-scroll"><?= get_sub_field('linkname'); ?></a>
  <?php endwhile; ?>
</nav>
