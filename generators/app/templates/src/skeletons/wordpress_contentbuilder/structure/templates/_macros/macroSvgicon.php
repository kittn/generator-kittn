<?php
/**
 *  SVG Icon
 *  ============
 *  Simple Links to the Social Network Fanpages
 *
 *  @param {string} icon                = Iconname
 *  @param {object} options             = Config Options
 *  @param {string} options.class       = Optional Classname
 *  @param {string} options.iconpath    = Path to icons
 *  @param {string} options.iconname    = Iconfile Name (Sprite)
 *  @param {string} options.viewbox     = Viewbox Size
 */
function macro_svgicon($icon, $options = []) {

  // Default Options
  $opt = [
    'class'       => false,
    'iconpath'    => '/assets/img/',
    'iconname'    => 'symbol-sprite.svg',
    'viewbox'     => '0 0 50 50'
  ];

  // Merge Options Array
  $options = array_replace($opt, $options);

  $class = ($options['class'] ? ' class="'.$options['class'].'"' : '');

  // Building Block - Modify structure if needed
  echo '<svg'.$class.' viewBox="'.$options['viewbox'].'">';
  echo '<use xlink:href="'.get_template_directory_uri().$options['iconpath'].$options['iconname'].'#'.$icon.'"></use>';
  echo '</svg>';
}
