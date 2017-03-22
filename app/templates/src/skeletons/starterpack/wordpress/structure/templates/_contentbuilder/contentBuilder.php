<?php
/**
  ContentBuilder
  ==============
  The Main ContentBuilder
*/

// Load Modules
if ( have_rows('content_builder') ) :
  while( have_rows('content_builder') ) : the_row();
    if (file_exists(get_template_directory() . '/_objects/'.camelize(get_row_layout()).'.php')) {
      include ( get_template_directory() . '/_objects/'.camelize(get_row_layout()).'.php' );
    } else {
      echo '<p style="color:red">There is no ContentBuilder Module Template for <b>'.get_row_layout().'</b> available!</p>';
    }
  endwhile;
endif;


