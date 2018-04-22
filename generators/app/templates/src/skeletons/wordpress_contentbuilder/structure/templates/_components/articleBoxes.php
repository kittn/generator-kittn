<?php
/**
 * ArticleBoxes
 * ============
 * The outer Wrapper comes from the parent file before the loop starts
 */
?>

<?php $c = 'c-articleBoxes' ?>
<?php $abImageRatio = 'rect' ?>

<article class="<?= $c . '__box' ?>" role="article" itemscope itemtype="http://schema.org/Article">
  <figure class="<?= $c . '__figure' ?>" role="group" itemscope itemtype="http://schema.org/ImageObject">
    <a href="<?php the_permalink(); ?>"
      <?php if (get_field('fi_image')) : ?>
        <?php macro_mediaImageSet(get_field('fi_image'), $c . '__image', $abImageRatio, true, false, false, 2); ?>
      <?php else : ?>
        class="<?= $c . '__image' ?>"
      <?php endif; ?>
    ></a>
  </figure>
  <div class="<?= $c . '__body' ?>">
    <header class="<?= $c . '__header' ?>">
      <div class="<?= $c . '__meta' ?>">
        <time itemprop="datePublished" datetime="<?= get_the_time('Y-m-d', $post->ID) ?>" class="<?= $c . '__date' ?>"><?= get_the_date('F j, Y', $post->ID) ?></time>
        <div class="<?= $c . '__author' ?>"><?= get_the_author() ?></div>
      </div>
      <h3 class="<?= $c . '__heading' ?>" role="heading">
        <a href="<?php the_permalink(); ?>"><?php the_title() ?></a>
      </h3>
    </header>
  </div>
</article>
