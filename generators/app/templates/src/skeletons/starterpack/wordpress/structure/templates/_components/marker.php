<?php
/**
 * Marker
 * ======
 * Small label for mark categories
 */
?>

<?php $c = 'c-marker' ?>

<?php if (count(get_the_category()) > 0) : ?>
<div class="<?= $c ?>">
  <?php
  foreach((get_the_category()) as $category) :
    echo '<a href="' . get_category_link( $category->term_id ) . '" class="' . $c . '__block">' . $category->cat_name . '</a>';
  endforeach;
  ?>
</div>
<?php endif; ?>
