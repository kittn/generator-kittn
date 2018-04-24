<?php
/**
  Copyright
  =========
 */
?>

<?php $c = 'c-copyright' ?>

<div class="<?= $c ?>">
  <?php if ( function_exists('get_field') && get_field('pg_copyright', 'option') ) : ?>
    <?= get_field('pg_copyright', 'option') ?>
  <?php else : ?>
    Copyright &copy; <?= date('Y') ?> <?= get_bloginfo('name') ?>. <?= __('Alle rechte vorbehalten.', 'kittn') ?>
  <?php endif;  ?>
</div>
