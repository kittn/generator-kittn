<?php
/**
  Media Box
  =========
  Contentblock with a Image or Video
*/

// Default Vars
$classname = 'o-mediabox';
$mediaPosition = '';
$mediaBackground = '';

// Position
if (get_sub_field('media_position') == 'right')
  $mediaPosition = ' '.$classname.'--right';

// Background
if (get_sub_field('background') != 'default')
  $mediaBackground = ' '.$classname.'--colored '.$classname.'--c-'.get_sub_field('background');

$ratio = get_sub_field('ratio');
?>

<?php // Building Element Block  ?>
<div class="<?= $classname.$mediaPosition.$mediaBackground; ?><?= ' '.$classname.'--'.get_sub_field('media_width'); ?>">
  <?php if (get_sub_field('photo') || get_sub_field('video')) : ?>
    <div class="<?= $classname; ?>__media">
      <?php if (get_sub_field('videobox')) : ?>
        <?php if (get_sub_field('video')) : ?>
          <video muted preload="none" autoplay="autoplay" class="<?= $classname; ?>__video" loop>
            <?php foreach (get_sub_field('video') as $video) : ?>
              <source src="<?= $video['url']; ?>" type="<?= $video['mime_type'];?>">
            <?php endforeach; ?>
            <?php if (get_sub_field('photo')) : ?>
              <?php macro_mediaImageSet(get_sub_field('photo'), $classname.'__image', $ratio); ?>
            <?php endif; // if photo ?>
          </video>
        <?php endif; // if video ?>

      <?php else : ?>
        <?php if (get_sub_field('photo')) : ?>
          <?php macro_mediaImageSet(get_sub_field('photo'), $classname.'__image', $ratio); ?>
        <?php endif; // if photo ?>
      <?php endif; // if Videobox ?>
    </div>
  <?php endif; ?>

  <div class="<?= $classname; ?>__body">
    <?= get_sub_field('textcontent'); ?>
  </div>
</div>
