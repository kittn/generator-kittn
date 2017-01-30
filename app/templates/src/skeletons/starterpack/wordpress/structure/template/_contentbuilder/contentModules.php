<?php
/**
  Content Modules
  ===============
  A collection of real Content Modules, without Wrapper Modules like Accordion.
  For the ACF Content Modules Group.
  Private!
*/

// Load Modules
if ( have_rows('content_modules') ) :
  while( have_rows('content_modules') ) : the_row();
    if (file_exists(get_template_directory() . '/_objects/'.camelize(get_row_layout()).'.php')) {
      include ( get_template_directory() . '/_objects/'.camelize(get_row_layout()).'.php' );
    } else {
      echo '<p style="color:red">There is no ContentBuilder Module Template for <b>'.get_row_layout().'</b> available!</p>';
    }
  endwhile;
endif;
