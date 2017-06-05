<?php
/**
 * Template Name: Contentbuilder
 */
?>

<?php get_header(); ?>
<main class="o-area__main" role="main">
  <div class="o-area__container">
  <?php if (have_posts()) : while (have_posts()) : the_post(); ?>
    <h1><?php the_title(); ?></h1>
    <?php // Include Contentbuilder ?>
    <?php include ( get_template_directory() . '/_contentbuilder/contentBuilder.php' ); ?>
  <?php endwhile; endif; ?>
  </div>
</main>
<?php get_footer(); ?>
