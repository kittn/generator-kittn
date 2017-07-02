<?php
/**
 * Social Share Macro
 * ==================
 * Build a Social Sharebar with Privacy Friendly Links
 *
 * @param {object} options             = Config Options
 * @param {string} options.class       = Classname
 * @param {*}      options.request     = Request URL
 * @param {*}      options.description = Seo Description
 * @param {*}      options.image       = Seo Image URL
 * @param {*}      options.title       = Seo Title
 * @param {bool}   options.icon        = Option that activate SVG Share Icons
 * @param {string} options.iconpath    = Path to icons
 * @param {string} options.iconname    = Iconfile Name (Sprite)
 * @param {string} options.iconprefix  = Prefix for icons
 * @param {string} options.viewbox     = Viewbox Size
 * @param {object} networks = Possible Social Networks
 * @param {bool}   networks.networks.facebook
 * @param {bool}   networks.networks.twitter
 * @param {bool}   networks.networks.googleplus
 * @param {bool}   networks.networks.pinterest
 * @param {bool}   networks.networks.mail
 * @param {bool}   networks.networks.whatsapp
 */
function macro_socialShare($options = []) {
  $opt = [
    'class'       => 'c-socialShare',
    'request'     => get_permalink(),
    'image'       => (has_post_thumbnail() ? get_the_post_thumbnail_url() : (get_field('fi_image') ? get_field('fi_image')['url'] : '')),
    'title'       => get_the_title(),
    'modifier'    => false,
    'icon'        => true,
    'iconpath'    => '/assets/img/',
    'iconname'    => 'symbol-sprite.svg',
    'iconprefix'  => 'icon-',
    'viewbox'     => '0 0 20 20',
    'networks'    => [
      'facebook'  => true,
      'twitter'   => true,
      'google-plus'=> true,
      'pinterest' => true,
      'email'      => false,
      'whatsapp'  => false
    ]
  ];

  // Merge Options Array
  $options = array_replace_recursive($opt, $options);

  // Build Share URLs
  $shareUrl = [
    'facebook'   => 'http://www.facebook.com/sharer.php?u='.$options['request'],
    'twitter'    => 'http://twitter.com/share?url='.$options['request'].'&amp;text='.$options['title'],
    'google-plus' => 'https://plus.google.com/share?url='.$options['request'],
    'pinterest'  => '//pinterest.com/pin/create/link/?url='.$options['request'].'&amp;media='.$options['image'].'&amp;description='.$options['title'],
    'email'       => 'mailto:?Subject='.$options['title'].'&Body=%20'.$options['request'],
    'whatsapp'   => 'whatsapp://send?text='.$options['request'].' '.$options['title']
  ];

  // Building Block - Modify structure if needed
  echo '<nav role="navigation" class="'.$options['class'].($options['modifier'] ? ' ' . $options['class'] . '--'.$options['modifier'] : '' ).'">';
  foreach ($options['networks'] as $key => $network) {
    if ($network) {
      echo ($options['icon'] == true ? '<div class="'.$options['class'].'__box">' : '');
      echo '<a href="'.$shareUrl[$key].'" target="_blank" class="'.$options['class'].'__link'.($options['icon'] == true ? '---solo' : '').'" title="Share with '.ucfirst($key).'">';
      if ($options['icon'] == true) {
        macro_svgicon($options['iconprefix'].$key, [
          'class' => $options['class'].'__icon'
        ]);
      } else {
        echo ucfirst($key);
      }
      echo '</a>';
      echo ($options['icon'] == true ? '</div>' : '');
    }

  }
  echo '</nav>';
}
