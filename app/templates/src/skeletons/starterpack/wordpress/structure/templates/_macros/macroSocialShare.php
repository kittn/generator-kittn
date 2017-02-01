<?php
/**
 *   Social Share Macro
 *   ==================
 *
 *   @param {object} options     = Config Options
 *   @param {string} options.class       = Classname
 *   @param {*}      options.request     = Request URL
 *   @param {*}      options.description = Seo Description
 *   @param {*}      options.image       = Seo Image URL
 *   @param {*}      options.title       = Seo Title
 *   @param {bool}   options.icon        = Option that activate SVG Share Icons
 *   @param {string} options.iconpath    = Path to icons
 *   @param {string} options.iconname    = Iconfile Name (Sprite)
 *   @param {string} options.iconprefix  = Prefix for icons
 *   @param {string} options.viewbox     = Viewbox Size
 *   @param {object} networks = Possible Social Networks
 *   @param {bool}   networks.networks.facebook
 *   @param {bool}   networks.networks.twitter
 *   @param {bool}   networks.networks.googleplus
 *   @param {bool}   networks.networks.pinterest
 *   @param {bool}   networks.networks.mail
 *   @param {bool}   networks.networks.whatsapp
 */
function macro_socialShare($options = []) {
  $opt = [
    'class'       => 'o-socialshare',
    'request'     => get_permalink(),
    'image'       => (has_post_thumbnail() ? the_post_thumbnail() : ''),
    'title'       => wp_title(),
    'icon'        => true,
    'iconpath'    => '/assets/img/',
    'iconname'    => 'symbol-sprite.svg',
    'iconprefix'  => 'icon-',
    'viewbox'     => '0 0 20 20',
    'networks'    => [
      'facebook'  => true,
      'twitter'   => true,
      'googleplus'=> true,
      'pinterest' => true,
      'mail'      => true,
      'whatsapp'  => false
    ]
  ];

  // Merge Options Array
  $options = array_replace_recursive($opt, $options);

  // Build Share URLs
  $shareUrl = [
    'facebook'   => 'http://www.facebook.com/sharer.php?u='.$options['request'],
    'twitter'    => 'http://twitter.com/share?url='.$options['request'].'&amp;text='.$options['title'],
    'googleplus' => 'https://plus.google.com/share?url='.$options['request'],
    'pinterest'  => '//pinterest.com/pin/create/link/?url='.$options['request'].'&amp;media='.$options['image'].'&amp;description='.$options['title'],
    'mail'       => 'mailto:?Subject='.$options['title'].'&Body=%20'.$options['request'],
    'whatsapp'   => 'whatsapp://send?text='.$options['request'].' '.$options['title']
  ];

  // Building Block - Modify structure if needed
  echo '<nav role="navigation" class="'.$options['class'].'">';
  foreach ($options['networks'] as $key => $network) {
    echo ($options['icon'] == true ? '<div class="'.$options['class'].'__box">' : '');
    echo '<a href="'.$shareUrl[$key].'" target="_blank" class="'.$options['class'].'__link'.($options['icon'] == true ? '---solo' : '').'" title="Share with '.ucfirst($key).'">';
    if ($options['icon'] == true) {
      echo '<svg class="'.$options['class'].'__icon" viewBox="'.$options['viewbox'].'">';
      echo '<use xlink:href="'.$options['iconpath'].$options['iconname'].'#'.$options['iconprefix'].$key.'"></use>';
      echo '</svg>';
    } else {
      echo $key;
    }
    echo '</a>';
    echo ($options['icon'] == true ? '</div>' : '');
  }
  echo '</nav>';
}
