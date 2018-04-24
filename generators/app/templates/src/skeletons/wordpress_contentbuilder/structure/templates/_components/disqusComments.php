<?php
/**
  Disqus
  =====
  Add a disqus comment field
 */
?>

<?php $c = 'c-disqusComments' ?>

<?php if ( get_field('pg_disqus_name', 'option') ) : ?>
  <div class="<?= $c ?>" id="comment-area">
    <div class="<?= $c . '__wrapper' ?>">
      <a class="<?= $c . '__button' ?>" data-disqus-name="<?= get_field('pg_disqus_name', 'option') ?>">
        <span><?= __('Kommentare anzeigen', 'kittn') ?></span>
      </a>
    </div>
    <div id="disqus_thread"></div>
  </div>
<?php endif; ?>
