<?php
/**
 * Gallery
 * =======
 * Creates a gallery object in two different layouts.
 * The simple layout lays the images together, the smart layout
 * tries to arrange the images in the photogrid. Pictures can be
 * enlarged on click. You can also use the gallery for individual images.
 */

// Default Vars
$classname = 'c-gallery';

// Base Vars
$galCountNr = '';
$thumbWidth = '';
$flexOverwrite = '';

// Count Gallery
$galleryCount = count(get_sub_field('gallery_entries'));
// Set Gallery Modus
$galCountMode = ($galleryCount > 1 ? ' '.$classname.'--moreimages' : '');
// Layout Class
$layout = ' '.$classname.'--l-'.get_sub_field('layout_type');
// Thumbnail Format
$thumbnailFormat = 'square';

// Set Gallery Type
if (get_sub_field('layout_type') == 'simple') {
  $thumbnailFormat = get_sub_field('format');
  // If Width is set
  if (get_sub_field('width')) {
    $thumbWidth = ' style=width:'.get_sub_field('width').' ';
    $flexOverwrite = ' '.$classname.'--noFlex';
  }
} elseif (get_sub_field('layout_type') == 'smart') {
  // Build Count Number
  $galCountNr = ($galleryCount < 10 ? ' '.$classname.'--'.$galleryCount : ' '.$classname.'--unlimited');
}
?>

<?php // Build Element Block ?>
<div class="is-photoswipped <?= $classname.$galCountNr.$galCountMode.$layout.$flexOverwrite; ?>" itemscope itemtype="http://schema.org/ImageGallery">
  <?php while( have_rows('gallery_entries') ) : the_row(); ?>
    <figure class="<?= $classname.'__figure'; ?>" itemprop="associatedMedia"<?= $thumbWidth; ?>itemscope itemtype="http://schema.org/ImageObject">
      <a class="<?= $classname.'__link'; ?>" href="<?= get_sub_field('photo')['url']; ?>" itemprop="contentUrl" data-size="<?= get_sub_field('photo')['width']; ?>x<?= get_sub_field('photo')['height']; ?>">
        <?php macro_mediaImageSet(get_sub_field('photo'), $classname.'__image', $thumbnailFormat, false, false, false, 2); ?>
      </a>
      <?php if (get_sub_field('caption')) : ?>
        <figcaption class="<?= $classname; ?>__caption<?= $galleryCount > 1 ? '---hidden' : ''; ?>" itemprop="caption description">
          <?= get_sub_field('caption'); ?>
        </figcaption>
      <?php endif; ?>
    </figure>
  <?php endwhile; ?>
</div>


<?php // Root element of PhotoSwipe. Must have class pswp. ?>
<div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="pswp__bg"></div>
  <div class="pswp__scroll-wrap">
    <?php // don't modify these 3 pswp__item elements, data is added later on. ?>
    <div class="pswp__container">
      <div class="pswp__item"></div>
      <div class="pswp__item"></div>
      <div class="pswp__item"></div>
    </div>
    <?php // Default (PhotoSwipeUI_Default) interface on top of sliding area. Can be changed. ?>
    <div class="pswp__ui pswp__ui--hidden">
      <div class="pswp__top-bar">
        <?php // Controls are self-explanatory. Order can be changed. ?>
        <div class="pswp__counter"></div>
        <button class="pswp__button pswp__button--close" title="Close (Esc)"></button>
        <button class="pswp__button pswp__button--share" title="Share"></button>
        <button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button>
        <button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>
        <div class="pswp__preloader">
          <div class="pswp__preloader__icn">
            <div class="pswp__preloader__cut">
              <div class="pswp__preloader__donut"></div>
            </div>
          </div>
        </div>
      </div>
      <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
        <div class="pswp__share-tooltip"></div>
      </div>
      <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)">
      </button>
      <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)">
      </button>
      <div class="pswp__caption">
        <div class="pswp__caption__center"></div>
      </div>
    </div>
  </div>
</div>
