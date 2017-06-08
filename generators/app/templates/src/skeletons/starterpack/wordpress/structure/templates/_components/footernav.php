<?php
/**
  Footernavigation
  ================
  Adding a Simple Mainnavigation Module
  Establish the Navmodul on the Backend!
*/

// Component Classname
$classname = 'c-footernav';

// Main Navigation
if ( has_nav_menu( 'footernav' ) ) : ?>
  <nav class="c-footernav" role="navigation" aria-label="Footer Navigation">
    <?php
    wp_nav_menu( array(
      'theme_location' => 'footernav',
      'menu_id'        => null,
      'container'      => false,
      'items_wrap'     => '<ul class="'.$classname.'__list">%3$s</ul>'
      )
    );
    ?>
  </nav>
<?php endif; ?>
