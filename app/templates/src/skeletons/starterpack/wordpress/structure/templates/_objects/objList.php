<?php
/**
 * List Module
 * ===========
 * Generate a List
 */

// Default Vars
$classname = 'o-list';
$listtype = '';
$liststyle = '';

// Define Listtype and Bulletstyle
if (get_sub_field('listtype') == 'ul') {
  $listtype = 'ul';

  // Add Liststyles
  switch (get_sub_field('style')) :
    case 'circle' :
      $liststyle = ' '.$classname.'--circle';
      break;
    case 'square' :
      $liststyle = ' '.$classname.'--square';
      break;
    case 'custom' :
      $liststyle = ' '.$classname.'--custom';
      break;
  endswitch;

} else {
  $listtype = 'ol';
  $liststyle = ' '.$classname.'--ordered';
}
?>

<?php // Building Element Block  ?>
<?php if (have_rows('list')) : ?>
<<?= $listtype; ?> class="<?= $classname; ?><?= $liststyle; ?>" role="list">
  <?php while( have_rows('list') ) : the_row(); ?>
    <li class="<?= $classname; ?>__entry"><?= get_sub_field('entry'); ?></li>
  <?php endwhile; ?>
</<?= $listtype; ?>>
<?php endif; ?>
