<?php
/**
 *  Social Networks
 *  ============
 *  Simple Links to the Social Network Fanpages
 *
 *  @param {object} options             = Config Options
 *  @param {string} options.class       = Classname
 *  @param {bool}   options.icon        = Option that activate SVG Share Icons
 *  @param {string} options.iconpath    = Path to icons
 *  @param {string} options.iconname    = Iconfile Name (Sprite)
 *  @param {string} options.iconprefix  = Prefix for icons
 *  @param {string} options.viewbox     = Viewbox Size
 *  @param {object} links               = Array with Social Links (default used the `social_link` fieldgroup)
 */
function macro_socialNetworks($options = [], $links = false) {
  $mylinks = array();
  // Default Links - uses ACF Globalfield
  if (function_exists('get_field') && get_field('pg_social_networks', 'option')) {
    $mylinks = $links ?: get_field('pg_social_networks', 'option');
  }

  // Default Options
  $opt = [
    'class'       => 'c-socialNetworks',
    'icon'        => true,
    'iconpath'    => '/assets/img/',
    'iconname'    => 'symbol-sprite.svg',
    'iconprefix'  => 'icon-',
    'viewbox'     => '0 0 20 20'
  ];

  // Merge Options Array
  $options = array_replace($opt, $options);

  // Building Block - Modify structure if needed
  echo '<nav role="navigation" class="'.$options['class'].'">';
  foreach ($mylinks as $key => $link) {
    echo ($options['icon'] == true ? '<div class="'.$options['class'].'__box">' : '');
    echo '<a href="'.$link['link'].'" target="_blank" class="'.$options['class'].'__link'.'" title="'.$link['title'].'">';
    if ($options['icon'] == true) {
      macro_svgicon($options['iconprefix'].$link['network'], [
        'class' => $options['class'].'__icon'
      ]);
    } else {
      echo ucfirst($link['network']);
    }
    echo '</a>';
    echo ($options['icon'] == true ? '</div>' : '');
  }
  echo '</nav>';
}



