<?php
/**
 *  Post Meta
 *  =============
 *  Module for display Meta Informations
 */
?>

<?php $c = 'c-postMeta' ?>

<div class="<?= $c ?>">
  <div class="<?= $c . '__avatar' ?>">
    <?= get_avatar( get_the_author_meta( 'ID' ), 32 ) ?>
  </div>
  <div class="<?= $c . '__details' ?>">
    <div class="<?= $c . '__author' ?>"><?= get_the_author() ?></div>
    <time itemprop="datePublished" datetime="<?= get_the_time('Y-m-d', $post->ID) ?>" class="<?= $c . '__date' ?>">
      <?= get_the_date('F j, Y', $post->ID) ?>
    </time>
  </div>
</div>
