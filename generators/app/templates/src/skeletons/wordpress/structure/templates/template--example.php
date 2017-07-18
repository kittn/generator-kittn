<?php
/**
 * Template Name: Example
 */
?>
<?php get_header(); ?>

<div class="appContent">
  <?php if (have_posts()) :
    while (have_posts()) : the_post(); ?>

      <h1><?php the_title(); ?></h1>

      <?php the_content(); ?>

    <?php endwhile;
  endif; ?>
</div>

<?php get_footer(); ?>
