<?php

class acf_field_markdown extends acf_field {


    /*
    *  __construct
    *
    *  This function will setup the field type data
    *
    *  @type    function
    *  @date    5/03/2014
    *  @since   5.0.0
    *
    *  @param   n/a
    *  @return  n/a
    */

    function __construct() {

        /*
        *  name (string) Single word, no spaces. Underscores allowed
        */

        $this->name = 'markdown';


        /*
        *  label (string) Multiple words, can include spaces, visible when selecting a field type
        */

        $this->label = __('Markdown', 'acf-markdown');


        /*
        *  category (string) basic | content | choice | relational | jquery | layout | CUSTOM GROUP NAME
        */

        $this->category = 'basic';


        /*
        *  defaults (array) Array of default settings which are merged into the field object. These are used later in settings
        */

        $this->defaults = array(
            'autogrow'      => '1',
            //'sidebyside'    => '1',
            'editor-theme'  => 'dark',
            'preview-theme' => 'github',
            'syntax-highlight' => '0',
            'syntax-theme' => 'monokai_sublime',
            'tab-function' => '0',
            'media-upload' => '0'
        );


        /*
        *  l10n (array) Array of strings that are used in JavaScript. This allows JS strings to be translated in PHP and loaded via:
        *  var message = acf._e('markdown', 'error');
        */

        $this->l10n = array(
            //'error'   => __('Error! Please enter a higher value', 'acf-markdown'),
        );


        // do not delete!
        parent::__construct();

    }


    /*
    *  render_field_settings()
    *
    *  Create extra settings for your field. These are visible when editing a field
    *
    *  @type    action
    *  @since   3.6
    *  @date    23/01/13
    *
    *  @param   $field (array) the $field being edited
    *  @return  n/a
    */

    function render_field_settings( $field ) {

        /*
        *  acf_render_field_setting
        *
        *  This function will create a setting for your field. Simply pass the $field parameter and an array of field settings.
        *  The array of settings does not require a `value` or `prefix`; These settings are found from the $field array.
        *
        *  More than one setting can be added by copy/paste the above code.
        *  Please note that you must also have a matching $defaults value for the field name (font_size)
        */

        /*acf_render_field_setting( $field, array(
            'label'         => __('Font Size','acf-markdown'),
            'instructions'  => __('Customise the input font size','acf-markdown'),
            'type'          => 'number',
            'name'          => 'font_size',
            'prepend'       => 'px',
        ));*/

        acf_render_field_setting( $field, array(
            'label'         => __('Autogrow','acf-markdown'),
            'instructions'  => __('Automatically grow input field to fit it\'s content.', 'acf-markdown'),
            'type'          => 'radio',
            'name'          => 'autogrow',
            'layout'        => 'horizontal',
            'choices'       => array(
                '1'         => __('Yes','acf-markdown'),
                '0'         => __('No','acf-markdown'),
            )
        ));

        /*acf_render_field_setting( $field, array(
            'label'         => __('Side-by-side preview','acf-markdown'),
            'instructions'  => __('Show preview side-by-side with the input field.', 'acf-markdown'),
            'type'          => 'radio',
            'name'          => 'sidebyside',
            'layout'        => 'horizontal',
            'choices'       => array(
                '1'         => __('Yes','acf-markdown'),
                '0'         => __('No','acf-markdown'),
            )
        ));*/

        acf_render_field_setting( $field, array(
            'label'         => __('Editor Theme','acf-markdown'),
            'instructions'  => __('Select theme to use for the markdown-editor.', 'acf-markdown'),
            'type'          => 'select',
            'name'          => 'editor-theme',
            'choices' => array(
                'dark'                      => 'Dark',
                'light'                     => 'Light',
            )
        ));

        acf_render_field_setting( $field, array(
            'label'         => __('Preview Theme','acf-markdown'),
            'instructions'  => __('Select theme to use for the preview.', 'acf-markdown'),
            'type'          => 'select',
            'name'          => 'preview-theme',
            'choices' => array(
                'github'        => 'GitHub',
                'bartik'        => 'Bartik',
                'preview-dark'  => 'Dark',
            )
        ));

        acf_render_field_setting( $field, array(
            'label'         => __('Syntax highlighting','acf-markdown'),
            'instructions'  => __('Activate syntax highlighting for code blocks in preview.', 'acf-markdown'),
            'type'          => 'radio',
            'name'          => 'syntax-highlight',
            'layout'        => 'horizontal',
            'choices'       => array(
                '1'         => __('Yes','acf-markdown'),
                '0'         => __('No','acf-markdown'),
            )
        ));

        acf_render_field_setting( $field, array(
            'label'         => __('Syntax Highlighting Theme','acf-markdown'),
            'instructions'  => __('Select theme to use for syntax highlighting. <a href="https://highlightjs.org/static/test.html" target="_blank">View examples!</a>', 'acf-markdown'),
            'type'          => 'select',
            'name'          => 'syntax-theme',
            'choices' => array(
                'arta' => 'Arta',
                'ascetic' => 'Ascetic',
                'atelier-dune.dark' => 'Atelier Dune - Dark',
                'atelier-dune.light' => 'Atelier Dune - Light',
                'atelier-forest.dark' => 'Atelier Forest - Dark',
                'atelier-forest.light' => 'Atelier Forest - Light',
                'atelier-heath.dark' => 'Atelier Heath - Dark',
                'atelier-heath.light' => 'Atelier Heath - Light',
                'atelier-lakeside.dark' => 'Atelier Lakeside - Dark',
                'atelier-lakeside.light' => 'Atelier Lakeside - Light',
                'atelier-seaside.dark' => 'Atelier Seaside - Dark',
                'atelier-seaside.light' => 'Atelier Seaside - Light',
                'brown_paper' => 'Brown Paper',
                'codepen-embed' => 'Codepen.io Embed',
                'color-brewer' => 'Colorbrewer',
                'dark' => 'Dark',
                'default' => 'Default',
                'docco' => 'Docco',
                'far' => 'FAR',
                'foundation' => 'Foundation',
                'github' => 'GitHub',
                'googlecode' => 'Google Code',
                'hybrid' => 'Hybrid',
                'idea' => 'IDEA',
                'ir_black' => 'IR Black',
                'kimbie.dark' => 'Kimbie - Dark',
                'kimbie.light' => 'Kimbie - Light',
                'magula' => 'Magula',
                'mono-blue' => 'Mono Blue',
                'monokai' => 'Monokai',
                'monokai_sublime' => 'Monokai Sublime',
                'obsidian' => 'Obsidian',
                'paraiso.dark' => 'Paraíso - Dark',
                'paraiso.light' => 'Paraíso - Light',
                'pojoaque' => 'Pojoaque',
                'railscasts' => 'Railscasts',
                'rainbow' => 'Rainbow',
                'school_book' => 'School Book',
                'solarized_dark' => 'Solarized - Dark',
                'solarized_light' => 'Solarized - Light',
                'sunburst' => 'Sunburst',
                'tomorrow' => 'Tomorrow',
                'tomorrow-night' => 'Tomorrow Night',
                'tomorrow-night-blue' => 'Tomorrow Night Blue',
                'tomorrow-night-bright' => 'Tomorrow Night Bright',
                'tomorrow-night-eighties' => 'Tomorrow Night Eighties',
                'vs' => 'Visual Studio',
                'xcode' => 'XCode',
                'zenburn' => 'Zenburn',
            )
        ));

        // media-upload
        acf_render_field_setting( $field, array(
            'label'         => __('Show Media Upload Buttons?','acf-markdown'),
            'instructions'  => '',
            'type'          => 'radio',
            'name'          => 'media-upload',
            'layout'        => 'horizontal',
            'choices'       => array(
                1               =>  __("Yes",'acf'),
                0               =>  __("No",'acf'),
            )
        ));

        /*acf_render_field_setting( $field, array(
            'label'         => __('Tab Key','acf-markdown'),
            'instructions'  => __('What does the tab-key to do when the editor is focused?', 'acf-markdown'),
            'type'          => 'select',
            'name'          => 'tab-function',
            'choices' => array(
                '0' => __('Normal functionality', 'acf-markdown'),
                '2' => __('Insert 2 spaces', 'acf-markdown'),
                '4' => __('Insert 4 spaces', 'acf-markdown'),
            )
        ));*/
    }

    /*
    *  render_field()
    *
    *  Create the HTML interface for your field
    *
    *  @param   $field (array) the $field being rendered
    *
    *  @type    action
    *  @since   3.6
    *  @date    23/01/13
    *
    *  @param   $field (array) the $field being edited
    *  @return  n/a
    */

    function render_field( $field ) {

        $dir = plugin_dir_url( __FILE__ );

        /*
        *  Review the data of $field.
        *  This will show what data is available
        */

        /*echo '<pre>';
            print_r( $field );
        echo '</pre>';*/
        $syntaxHighlight = false;

        if( $field['syntax-highlight'] == '1' ) {
            $syntaxHighlight = true;
            wp_enqueue_script( 'highlightjs' );
        }

        $id = 'editor_' . uniqid();
        $textareaId = $id . '_textarea';

        acf_hidden_input(array(
            'type'  => 'hidden',
            'name'  => $field['name'],
            'id'    => $textareaId,
            'value' => $field['value']
        ));

        wp_localize_script( 'acf-input-markdown',  $id, array(
            'containerId' => $id,
            'textareaId' => $textareaId,
            'basePath' => "{$dir}js/lib/EpicEditor-v0.2.2",
            'autogrow' => ($field['autogrow'] == '1'),
            'theme' => array(
                'base' => '/themes/base/epiceditor.css',
                'preview' => "/themes/preview/" . $field["preview-theme"] . ".css?v=1",
                'editor' => "/themes/editor/epic-" . $field["editor-theme"] . ".css?v=1"
            ),
            'syntaxHighlight' => $syntaxHighlight,
            'syntaxTheme' => "{$dir}js/lib/highlight/styles/" . $field['syntax-theme'] . ".css",
            //'tabFunction' => $field['tab-function']
        ));

        if( $field['media-upload'] ) {
            acf_hidden_input(array(
                'type'  => 'hidden',
                'name'  => 'wp-' . $id . '-media-input',
                'id'    => 'wp-' . $id . '-media-input',
                'class' => 'wp-media-input'
            ));
        }

        wp_enqueue_script( 'acf-input-markdown' );
    ?>
        <?php if( $field['media-upload'] ) { ?>
        <div id="wp-<?php echo $id; ?>-media-button" class="wp-media-buttons">
            <?php do_action( 'media_buttons' ); ?>
        </div>
        <?php } ?>
        <div id="<?php echo $id; ?>" data-acf-markdown-editor class="acf-field-markdown-editor"></div>
    <?php
    }


    /*
    *  input_admin_enqueue_scripts()
    *
    *  This action is called in the admin_enqueue_scripts action on the edit screen where your field is created.
    *  Use this action to add CSS + JavaScript to assist your render_field() action.
    *
    *  @type    action (admin_enqueue_scripts)
    *  @since   3.6
    *  @date    23/01/13
    *
    *  @param   n/a
    *  @return  n/a
    */

    function input_admin_enqueue_scripts() {

        $dir = plugin_dir_url( __FILE__ );


        // register & include JS
        wp_register_script( 'epiceditor', "{$dir}js/lib/EpicEditor-v0.2.2/js/epiceditor.js" );
        wp_register_script( 'acf-input-markdown', "{$dir}js/input.js", array( 'epiceditor' ), '1.1.4');
        wp_register_script( 'highlightjs', "{$dir}js/lib/highlight/highlight.pack.js" );

        wp_enqueue_script( 'epiceditor' );

        wp_enqueue_media();

        // register & include CSS
        wp_register_style( 'acf-input-markdown', "{$dir}css/input.css", array(), '1.1.4' );
        wp_enqueue_style( 'acf-input-markdown' );
    }


    /*
    *  input_admin_head()
    *
    *  This action is called in the admin_head action on the edit screen where your field is created.
    *  Use this action to add CSS and JavaScript to assist your render_field() action.
    *
    *  @type    action (admin_head)
    *  @since   3.6
    *  @date    23/01/13
    *
    *  @param   n/a
    *  @return  n/a
    */

    /*

    function input_admin_head() {



    }

    */


    /*
    *  input_form_data()
    *
    *  This function is called once on the 'input' page between the head and footer
    *  There are 2 situations where ACF did not load during the 'acf/input_admin_enqueue_scripts' and
    *  'acf/input_admin_head' actions because ACF did not know it was going to be used. These situations are
    *  seen on comments / user edit forms on the front end. This function will always be called, and includes
    *  $args that related to the current screen such as $args['post_id']
    *
    *  @type    function
    *  @date    6/03/2014
    *  @since   5.0.0
    *
    *  @param   $args (array)
    *  @return  n/a
    */

    /*

    function input_form_data( $args ) {



    }

    */


    /*
    *  input_admin_footer()
    *
    *  This action is called in the admin_footer action on the edit screen where your field is created.
    *  Use this action to add CSS and JavaScript to assist your render_field() action.
    *
    *  @type    action (admin_footer)
    *  @since   3.6
    *  @date    23/01/13
    *
    *  @param   n/a
    *  @return  n/a
    */

    /*

    function input_admin_footer() {



    }

    */


    /*
    *  field_group_admin_enqueue_scripts()
    *
    *  This action is called in the admin_enqueue_scripts action on the edit screen where your field is edited.
    *  Use this action to add CSS + JavaScript to assist your render_field_options() action.
    *
    *  @type    action (admin_enqueue_scripts)
    *  @since   3.6
    *  @date    23/01/13
    *
    *  @param   n/a
    *  @return  n/a
    */

    /*

    function field_group_admin_enqueue_scripts() {

    }

    */


    /*
    *  field_group_admin_head()
    *
    *  This action is called in the admin_head action on the edit screen where your field is edited.
    *  Use this action to add CSS and JavaScript to assist your render_field_options() action.
    *
    *  @type    action (admin_head)
    *  @since   3.6
    *  @date    23/01/13
    *
    *  @param   n/a
    *  @return  n/a
    */

    /*

    function field_group_admin_head() {

    }

    */


    /*
    *  load_value()
    *
    *  This filter is applied to the $value after it is loaded from the db
    *
    *  @type    filter
    *  @since   3.6
    *  @date    23/01/13
    *
    *  @param   $value (mixed) the value found in the database
    *  @param   $post_id (mixed) the $post_id from which the value was loaded
    *  @param   $field (array) the field array holding all the field options
    *  @return  $value
    */

    /*

    function load_value( $value, $post_id, $field ) {

        return $value;

    }

    */


    /*
    *  update_value()
    *
    *  This filter is applied to the $value before it is saved in the db
    *
    *  @type    filter
    *  @since   3.6
    *  @date    23/01/13
    *
    *  @param   $value (mixed) the value found in the database
    *  @param   $post_id (mixed) the $post_id from which the value was loaded
    *  @param   $field (array) the field array holding all the field options
    *  @return  $value
    */

    /*

    function update_value( $value, $post_id, $field ) {

        return $value;

    }

    */


    /*
    *  format_value()
    *
    *  This filter is appied to the $value after it is loaded from the db and before it is returned to the template
    *
    *  @type    filter
    *  @since   3.6
    *  @date    23/01/13
    *
    *  @param   $value (mixed) the value which was loaded from the database
    *  @param   $post_id (mixed) the $post_id from which the value was loaded
    *  @param   $field (array) the field array holding all the field options
    *
    *  @return  $value (mixed) the modified value
    */

    /*

    function format_value( $value, $post_id, $field ) {

        // bail early if no value
        if( empty($value) ) {

            return $value;

        }


        // apply setting
        if( $field['font_size'] > 12 ) {

            // format the value
            // $value = 'something';

        }


        // return
        return $value;
    }

    */


    /*
    *  validate_value()
    *
    *  This filter is used to perform validation on the value prior to saving.
    *  All values are validated regardless of the field's required setting. This allows you to validate and return
    *  messages to the user if the value is not correct
    *
    *  @type    filter
    *  @date    11/02/2014
    *  @since   5.0.0
    *
    *  @param   $valid (boolean) validation status based on the value and the field's required setting
    *  @param   $value (mixed) the $_POST value
    *  @param   $field (array) the field array holding all the field options
    *  @param   $input (string) the corresponding input name for $_POST value
    *  @return  $valid
    */

    /*

    function validate_value( $valid, $value, $field, $input ){

        // Basic usage
        if( $value < $field['custom_minimum_setting'] )
        {
            $valid = false;
        }


        // Advanced usage
        if( $value < $field['custom_minimum_setting'] )
        {
            $valid = __('The value is too little!','acf-markdown'),
        }


        // return
        return $valid;

    }

    */


    /*
    *  delete_value()
    *
    *  This action is fired after a value has been deleted from the db.
    *  Please note that saving a blank value is treated as an update, not a delete
    *
    *  @type    action
    *  @date    6/03/2014
    *  @since   5.0.0
    *
    *  @param   $post_id (mixed) the $post_id from which the value was deleted
    *  @param   $key (string) the $meta_key which the value was deleted
    *  @return  n/a
    */

    /*

    function delete_value( $post_id, $key ) {



    }

    */


    /*
    *  load_field()
    *
    *  This filter is applied to the $field after it is loaded from the database
    *
    *  @type    filter
    *  @date    23/01/2013
    *  @since   3.6.0
    *
    *  @param   $field (array) the field array holding all the field options
    *  @return  $field
    */

    /*

    function load_field( $field ) {

        return $field;

    }

    */


    /*
    *  update_field()
    *
    *  This filter is applied to the $field before it is saved to the database
    *
    *  @type    filter
    *  @date    23/01/2013
    *  @since   3.6.0
    *
    *  @param   $field (array) the field array holding all the field options
    *  @return  $field
    */

    /*

    function update_field( $field ) {

        return $field;

    }

    */


    /*
    *  delete_field()
    *
    *  This action is fired after a field is deleted from the database
    *
    *  @type    action
    *  @date    11/02/2014
    *  @since   5.0.0
    *
    *  @param   $field (array) the field array holding all the field options
    *  @return  n/a
    */

    /*

    function delete_field( $field ) {



    }

    */


}


// create field
new acf_field_markdown();

?>
