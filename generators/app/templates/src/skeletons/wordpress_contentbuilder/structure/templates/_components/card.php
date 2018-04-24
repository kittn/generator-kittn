<?php
/**
 * Card
 * =========
 * Media and text content as card module
 */

// Default Vars
$classname = 'c-card';
$style = get_sub_field('style');
?>

<?php // Building Element Block  ?>
<div class="<?= $classname; ?><?= $style != 'default' ? ' '.$classname.'--s-'.$style : '' ?>" role="group" itemscope itemtype="http://schema.org/MediaObject">
  <div class="<?= $classname.'__inner'; ?>">
    <?php if (get_sub_field('photo')) : ?>
      <figure class="<?= $classname.'__media'; ?>">
        <?php macro_mediaImageSet(get_sub_field('photo'), $classname.'__image', get_sub_field('ratio')); ?>
      </figure>
    <?php endif; ?>

    <?php if (get_sub_field('headline') != '' or get_sub_field('subline') != '' or get_sub_field('meta') != '' or get_sub_field('body') != '') : ?>
      <div class="<?= $classname.'__copy'; ?>">
        <?php if (get_sub_field('headline') != '' or get_sub_field('subline') != '' or get_sub_field('meta') != '') : ?>
          <header class="<?= $classname.'__header'; ?>">
            <?php if (get_sub_field('meta') != '') : ?><span class="<?= $classname.'__meta'; ?>"><?= get_sub_field('meta'); ?></span><?php endif; ?>
            <?php if (get_sub_field('headline') != '') : ?>
              <?php if (get_sub_field('link')) : ?> <a href="<?= get_sub_field('link')['url'] ?>" <?php if ( get_sub_field('link')['target'] == 1 ) : ?>target="_blank"<?php endif; ?>> <?php endif; ?>
              <h3 class="<?= $classname.'__headline'; ?>"><?= get_sub_field('headline'); ?></h3>
              <?php if (get_sub_field('link')) : ?></a><?php endif; ?>
            <?php endif; ?>
            <?php if (get_sub_field('subline') != '') : ?><h6 class="<?= $classname.'__subline'; ?>"><?= get_sub_field('subline'); ?></h6><?php endif; ?>
          </header>
        <?php endif; ?>
        <?php if (get_sub_field('body') != '') : ?>
          <div class="<?= $classname.'__body'; ?>">
            <?= get_sub_field('body'); ?>
          </div>
        <?php endif; ?>
      </div>
    <?php endif; ?>
  </div>
</div>
