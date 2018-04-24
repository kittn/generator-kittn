<?php
/**
 * Featured Image
 * ==============
 */
?>

<?php $c = 'c-featuredImage' ?>
<?php if ( get_field('fi_image')) : ?>
  <figure class="<?= $c ?><?= get_field('fi_fullbleed') ? ' ' . $c . '--fullbleed' : '' ?>" role="group" itemscope itemtype="http://schema.org/ImageObject">
    <?php macro_mediaImageSet(get_field('fi_image'), $c . '__image', get_field('fi_ratio')); ?>

    <?php // Add Optional Overlay ?>
    <?php if (get_field('fi_headline') || get_field('fi_link') ) : ?>
      <div class="<?= $c . '__overlay' ?>">
        <div class="<?= $c . '__inner' ?>">
          <?php if (get_field('fi_headline')) : ?>
            <h2 class="<?= $c . '__headline' ?>" role="heading"><?= get_field('fi_headline') ?></h2>
          <?php endif; ?>

          <?php if (get_field('fi_link')) : ?>
            <?php $linkElement = get_field('fi_link') ?>
            <div class="c-button c-button--center">
              <a itemprop="url"
                 role="button"
                 href="<?= $linkElement['url'] ?>"
                 <?php if ( $linkElement['target'] == 1 ) : ?>target="_blank"<?php endif; ?>
                 class="c-button__element c-button--s-default">
                <?= $linkElement['title'] ? $linkElement['title'] : __('Link', 'kittn')  ?>
              </a>
            </div>
          <?php endif; ?>
        </div>
      </div>
    <?php endif; ?>

  </figure>
<?php endif; ?>
