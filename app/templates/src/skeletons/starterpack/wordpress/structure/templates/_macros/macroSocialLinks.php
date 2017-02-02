<?php
/**
 *  Social Links
 *  ============
 *  Build a Navblock to the social networks
 *
 *  @param {object} options     = Config Options
 *  @param {string} options.class       = Classname
 *  @param {bool}   options.icon        = Option that activate SVG Share Icons
 *  @param {string} options.iconpath    = Path to icons
 *  @param {string} options.iconname    = Iconfile Name (Sprite)
 *  @param {string} options.iconprefix  = Prefix for icons
 *  @param {string} options.viewbox     = Viewbox Size
 */
function macro_socialLinks($links, $options = []) {
  $opt = [
    'class'       => 'o-sociallink',
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
  foreach ($links as $key => $link) {
    echo ($options['icon'] == true ? '<div class="'.$options['class'].'__box">' : '');
    echo '<a href="'.$link['link'].'" target="_blank" class="'.$options['class'].'__link'.($options['icon'] == true ? '---solo' : '').'" title="'.$link['title'].'">';
    if ($options['icon'] == true) {
      echo '<svg class="'.$options['class'].'__icon" viewBox="'.$options['viewbox'].'">';
      echo '<use xlink:href="'.$options['iconpath'].$options['iconname'].'#'.$options['iconprefix'].$link['network'].'"></use>';
      echo '</svg>';
    } else {
      echo ucfirst($link['network']);
    }
    echo '</a>';
    echo ($options['icon'] == true ? '</div>' : '');
  }
  echo '</nav>';
}
