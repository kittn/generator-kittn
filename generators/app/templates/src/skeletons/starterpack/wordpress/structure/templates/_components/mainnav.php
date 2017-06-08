<?php
/**
  Mainnavigation
  ==============
  Adding a Simple Mainnavigation Module.
  Establish the Navmodul on the Backend!
*/

// Component Classname
$classname = 'c-mainnav';

// Main Navigation
if ( has_nav_menu( 'mainnav' ) ) : ?>
  <nav class="<?= $classname; ?>" role="navigation" aria-label="Main Navigation">
    <?php
    wp_nav_menu( array(
      'theme_location' => 'mainnav',
      'menu_id'        => null,
      'container'      => false,
      'items_wrap'     => '<ul class="'.$classname.'__list">%3$s</ul>'
      )
    );
    ?>
  </nav>
<?php endif; ?>
