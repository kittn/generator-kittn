<?php get_header(); ?>

<div class="appContent">
  <? if (have_posts()) :
    while (have_posts()) : the_post(); ?>

      <h1><?php the_title(); ?></h1>

      <?php the_content(); ?>

    <?php endwhile;
  endif; ?>
</div>

<?php get_footer(); ?>
