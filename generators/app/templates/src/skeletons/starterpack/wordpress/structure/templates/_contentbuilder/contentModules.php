<?php
/**
  Content Modules
  ===============
  A collection of real Content Modules, without Wrapper Modules like Accordion.
  For the ACF Content Modules Group.
  Private!
*/

// Load Modules
if ( have_rows('contentModules') ) :
  while( have_rows('contentModules') ) : the_row();
    if (file_exists(get_template_directory() . '/_components/'.camelize(get_row_layout()).'.php')) {
      include ( get_template_directory() . '/_components/'.camelize(get_row_layout()).'.php' );
    } else {
      echo '<p style="color:red">There is no ContentBuilder Module Template for <b>'.get_row_layout().'</b> available!</p>';
    }
  endwhile;
endif;
