<?php
/**
  ContentBuilder
  ==============
  The Main ContentBuilder
*/

if ( have_rows('content_builder') ) :
  while( have_rows('content_builder') ) : the_row();
    switch( get_row_layout() ) :
      // Module:
      case 'cb_' :
        // include ( get_template_directory() . '/_objects/header.php' );
        break;

    endswitch;
  endwhile;
endif;
