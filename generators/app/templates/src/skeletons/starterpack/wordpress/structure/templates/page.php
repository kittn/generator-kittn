<?php get_header(); ?>
<main class="o-area__main" role="main">
  <div class="o-area__container">
  <?php $pageType = get_post_field( 'post_name' ) ?>

  <?php // Featured Image ?>
  <?php include ( get_template_directory() . '/_components/featuredImage.php' ); ?>

  <h1><?php the_title(); ?></h1>

  <?php // Include Contentbuilder ?>
  <?php include ( get_template_directory() . '/_contentbuilder/contentBuilder.php' ); ?>

  <?php // Add Individual Pagesection with generic item ?>
  <?php
  switch ($pageType) {
    case 'home' :
      include ( get_template_directory() . '/_parts/pages--home.php' );

      break;
  }
  ?>


  </div>
</main>
<?php get_footer(); ?>
