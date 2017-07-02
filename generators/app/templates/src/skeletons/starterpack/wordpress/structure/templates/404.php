<?php get_header(); ?>
<main class="o-area__main" role="main">
  <div class="o-area__container">
    <h1><?= __('Error 404!', 'kittn') ?></h1>
    <p><?= __('Die gesuchte Seite wurde nicht gefunden.', 'kittn') ?></p>
    <div class="o-button">
      <a href="<?= home_url() ?>" class="o-button__element o-button--s-default"><?= __('Zur Startseite', 'kittn') ?></a>
    </div>
  </div>
</div>
<?php get_footer(); ?>


