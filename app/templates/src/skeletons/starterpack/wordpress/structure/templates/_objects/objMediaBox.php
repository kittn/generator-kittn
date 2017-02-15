<?php
/**
 * Media Box
 * =========
 * A Mediabox with image / video and text content
 */

// Default Vars
$classname = 'o-mediabox';

// Base Bars
$mediaPosition = '';
$mediaBackground = '';

// Position
if (get_sub_field('media_position') == 'right')
  $mediaPosition = ' '.$classname.'--right';

// Background
if (get_sub_field('background') != 'default')
  $mediaBackground = ' '.$classname.'--colored '.$classname.'--c-'.get_sub_field('background');
?>

<?php // Building Element Block  ?>
<div class="<?= $classname.$mediaPosition.$mediaBackground; ?><?= ' '.$classname.'--'.get_sub_field('media_width'); ?>" role="group" itemscope itemtype="http://schema.org/MediaObject">
  <?php if (get_sub_field('photo') || get_sub_field('video')) : ?>
    <div class="<?= $classname; ?>__media">
      <?php if (get_sub_field('videobox')) : ?>
        <?php if (get_sub_field('video')) : ?>
          <video muted preload="none" autoplay="autoplay" class="<?= $classname; ?>__video" loop role="application">
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
    </div>
  <?php endif; ?>

  <div class="<?= $classname; ?>__body">
    <?= get_sub_field('textcontent'); ?>
  </div>
</div>
