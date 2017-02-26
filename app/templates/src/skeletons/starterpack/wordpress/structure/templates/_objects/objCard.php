<?php
/**
 * Card
 * =========
 * Media and text content as card module
 */

// Default Vars
$classname = 'o-card';
$activeLink = get_sub_field('internalLink') != '' || get_sub_field('externalLink') != '' ? true : false;
$linkTarget = get_sub_field('linktype') == 'external' ? ' target="_blank"' : '';
$style = get_sub_field('style');
?>

<?php // Building Element Block  ?>
<div class="<?= $classname; ?><?= $style != 'default' ? ' '.$classname.'--s-'.$style : '' ?>" role="group" itemscope itemtype="http://schema.org/MediaObject">
  <div class="<?= $classname.'__inner'; ?>">
    <?php if (get_sub_field('photo') || get_sub_field('video')) : ?>
      <figure class="<?= $classname.'__media'; ?>">
        <?php if (get_sub_field('videobox')) : ?>
          <?php if (get_sub_field('video')) : ?>
            <video muted preload="none" autoplay="autoplay" class="<?= $classname.'__video'; ?>" loop role="application">
              <?php foreach (get_sub_field('video') as $video) : ?>
                <source src="<?= $video['url']; ?>" type="<?= $video['mime_type'];?>">
              <?php endforeach; ?>
              <?php if (get_sub_field('photo')) : ?>
                <?php macro_mediaImageSet(get_sub_field('photo'), $classname.'__image', get_sub_field('ratio')); ?>
              <?php endif; // if photo ?>
            </video>
          <?php endif; // if video ?>

        <?php else : ?>
          <?php if (get_sub_field('photo')) : ?>
            <?php macro_mediaImageSet(get_sub_field('photo'), $classname.'__image', get_sub_field('ratio')); ?>
          <?php endif; // if photo ?>
        <?php endif; // if Videobox ?>
      </figure>
    <?php endif; ?>

    <?php if (get_sub_field('headline') != '' or get_sub_field('subline') != '' or get_sub_field('meta') != '' or get_sub_field('body') != '') : ?>
      <div class="<?= $classname.'__copy'; ?>">
        <?php if (get_sub_field('headline') != '' or get_sub_field('subline') != '' or get_sub_field('meta') != '') : ?>
          <header class="<?= $classname.'__header'; ?>">
            <?php if (get_sub_field('meta') != '') : ?><span class="<?= $classname.'__meta'; ?>"><?= get_sub_field('meta'); ?></span><?php endif; ?>
            <?php if (get_sub_field('headline') != '') : ?>
              <?php if ($activeLink) : ?><a href="<?= get_sub_field('linktype') == 'external' ? get_sub_field('externalLink') : get_sub_field('internalLink') ?>" <?= $linkTarget ?>><?php endif; ?>
              <h3 class="<?= $classname.'__headline'; ?>"><?= get_sub_field('headline'); ?></h3>
              <?php if ($activeLink) : ?></a><?php endif; ?>
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
