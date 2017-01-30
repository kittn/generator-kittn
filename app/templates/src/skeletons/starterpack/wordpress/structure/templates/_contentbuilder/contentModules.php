<?php
/**
  Content Modules
  ===============
  A collection of real Content Modules, without Wrapper Modules like Accordion

*/

if ( have_rows('content_modules') ) :
  while( have_rows('content_modules') ) : the_row();
    switch( get_row_layout() ) :
      // Headline Module
      case 'obj_headline' :
        include ( get_template_directory() . '/_objects/objHeadline.php' );
        break;

      // Richtext Module
      case 'obj_richtext' :
        include ( get_template_directory() . '/_objects/objRichtext.php' );
        break;

      // List Module
      case 'obj_list' :
        include ( get_template_directory() . '/_objects/objList.php' );
        break;

      // Quote Module
      case 'obj_quote' :
        include ( get_template_directory() . '/_objects/objQuote.php' );
        break;

      // Mediabox
      case 'obj_media_box' :
        include ( get_template_directory() . '/_objects/objMediaBox.php' );
        break;

      // Media Image
      case 'obj_media_image' :
        include ( get_template_directory() . '/_objects/objMediaImage.php' );
        break;

      // Gallery
      case 'obj_gallery' :
        include ( get_template_directory() . '/_objects/objGallery.php' );
        break;

      // Image Slider
      case 'obj_image_slider' :
        include ( get_template_directory() . '/_objects/objImageSlider.php' );
        break;

      // Text Slider
      case 'obj_text_slider' :
        include ( get_template_directory() . '/_objects/objTextSlider.php' );
        break;

      case 'obj_iframe_content' :
        include ( get_template_directory() . '/_objects/objIframeContent.php' );
        break;

      case 'obj_button' :
        include ( get_template_directory() . '/_objects/objButton.php' );
        break;

      case 'obj_slide_out_box' :
        // include ( get_template_directory() . '/_objects/header.php' );
        echo 'this is a SlideOut Box';
        break;

      case 'obj_horizontal_ruler' :
        include ( get_template_directory() . '/_objects/objHorizontalRuler.php' );
        break;

      case 'obj_spacer' :
        include ( get_template_directory() . '/_objects/objSpacer.php' );
        break;

      case 'obj_anchor' :
        include ( get_template_directory() . '/_objects/objAnchor.php' );
        break;

      case 'obj_jumpnavigation' :
        // include ( get_template_directory() . '/_objects/header.php' );
        echo 'this is a Jumpnavigation';
        break;

    endswitch;
  endwhile;
endif;
