<?php get_header(); ?>
  <main class="o-area__main" role="main">
    <?php if (have_posts()) : while (have_posts()) : the_post(); ?>
      <?php // Get Post Type ?>
      <?php $pType = get_post_type( get_the_ID() ); ?>

      <article class="c-articleEntry" role="article" itemscope itemtype="http://schema.org/Article">
        <?php // Featured Image ?>
        <?php include ( get_template_directory() . '/_components/featuredImage.php' ); ?>

        <header class="c-articleEntry__header" role="header">
          <?php // ADD postMeta ?>
          <?php
          switch ($pType) {
            case 'post' :
              include ( get_template_directory() . '/_components/postMeta.php' );
              break;
          }
          ?>

          <h1 role="heading" itemprop="name" class="c-articleEntry__headline"><?php the_title(); ?></h1>

          <?php // Add Marker ?>
          <?php
          switch ($pType) {
            case 'post' :
              include ( get_template_directory() . '/_components/marker.php' );
              break;
          }
          ?>
        </header>

        <?php // Include Contentbuilder ?>
        <?php include ( get_template_directory() . '/_contentbuilder/contentBuilder.php' ); ?>

        <footer class="c-articleEntry__footer">
          <?php // Social Share ?>
          <?php macro_socialShare($options = [ 'modifier' => 'button' ]) ?>

          <?php // Add Disqus ?>
          <?php
          switch ($pType) {
            case 'post' :
              if ( get_field( 'commentSwitch' ) != true ) {
                include( get_template_directory() . '/_components/disqusComments.php' );
              }
              break;
          }
          ?>

        </footer>

      </article>
    <?php endwhile; endif; ?>
  </main>
<?php get_footer(); ?>
