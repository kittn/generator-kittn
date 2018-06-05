<?php
/**
 * List
 * ====
 * Creates a list of freely selectable bullets and individual styling
 */

// Default Vars
$classname = 'c-list';
$listtype = '';
$liststyle = get_sub_field('style') ? ' '.get_sub_field('style') : '';

// Define Listtype and Bulletstyle
if (get_sub_field('listtype') == 'ul') {
  $listtype = 'ul';

} else {
  $listtype = 'ol';
}
?>

<?php // Building Element Block  ?>
<?php if (have_rows('list')) : ?>
<<?= $listtype; ?> class="<?= $classname; ?><?= $liststyle ?>" role="list">
  <?php while( have_rows('list') ) : the_row(); ?>
    <li class="<?= $classname.'__entry'; ?>"><?= get_sub_field('entry'); ?></li>
  <?php endwhile; ?>
</<?= $listtype; ?>>
<?php endif; ?>
