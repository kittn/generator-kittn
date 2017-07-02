<?php
/**
 * Home Parts
 * ==========
 */

// Query Blogposts
$blogQuery = new WP_Query(array(
  'post_type' => 'post',
  'posts_per_page' => 12
));
?>

<?php if ($blogQuery->have_posts()) : ?>
  <div class="c-articleBoxes">
  <?php while ($blogQuery->have_posts()) : $blogQuery->the_post(); ?>
    <?php include ( get_template_directory() . '/_components/articleBoxes.php' ); ?>
  <?php wp_reset_postdata(); wp_reset_query(); endwhile; ?>
  </div>
<?php endif;?>
