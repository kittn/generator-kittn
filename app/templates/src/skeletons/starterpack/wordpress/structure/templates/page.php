<?php get_header(); ?>
<main class="o-layout__main" role="main">
  <div class="o-layout__container">
  <?php if (have_posts()) : while (have_posts()) : the_post(); ?>
    <h1><?php the_title(); ?></h1>
    <?php the_content(); ?>
    <?php // Include Contentbuilder ?>
    <?php include ( get_template_directory() . '/_contentbuilder/contentBuilder.php' ); ?>
  <?php endwhile; endif; ?>
  </div>
</main>
<?php get_footer(); ?>
