<?php

class acf_field_markdown extends acf_field {

    // vars
    var $settings, // will hold info such as dir / path
        $defaults; // will hold default field options


    /*
    *  __construct
    *
    *  Set name / label needed for actions / filters
    *
    *  @since   3.6
    *  @date    23/01/13
    */

    function __construct()
    {
        // vars
        $this->name = 'markdown';
        $this->label = __('Markdown');
        $this->category = __("Basic",'acf'); // Basic, Content, Choice, etc
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


        // do not delete!
        parent::__construct();


        // settings
        $this->settings = array(
            'path' => apply_filters('acf/helpers/get_path', __FILE__),
            'dir' => apply_filters('acf/helpers/get_dir', __FILE__),
            'version' => '1.1.4'
        );

    }


    /*
    *  create_options()
    *
    *  Create extra options for your field. This is rendered when editing a field.
    *  The value of $field['name'] can be used (like below) to save extra data to the $field
    *
    *  @type    action
    *  @since   3.6
    *  @date    23/01/13
    *
    *  @param   $field  - an array holding all the field's data
    */

    function create_options( $field )
    {
        // defaults?
        $field = array_merge($this->defaults, $field);

        // key is needed in the field names to correctly save the data
        $key = $field['name'];


        // Create Field Options HTML
        ?>
<tr class="field_option field_option_<?php echo $this->name; ?>">
    <td class="label">
        <label><?php _e("Autogrow",'acf-markdown'); ?></label>
        <p class="description"><?php _e("Automatically grow input field to fit it's content.", 'acf-markdown'); ?></p>
    </td>
    <td>
        <?php

        do_action('acf/create_field', array(
            'type'          => 'radio',
            'name'          => 'fields['.$key.'][autogrow]',
            'value'         =>  $field['autogrow'],
            'layout'        => 'horizontal',
            'choices'       => array(
                '1'         => __('Yes','acf-markdown'),
                '0'         => __('No','acf-markdown'),
            )
        ));

        ?>
    </td>
</tr>
<tr class="field_option field_option_<?php echo $this->name; ?>">
    <td class="label">
        <label><?php _e("Editor Theme",'acf-markdown'); ?></label>
        <p class="description"><?php _e("Select theme to use for the markdown-editor.", 'acf-markdown'); ?></p>
    </td>
    <td>
        <?php

        do_action('acf/create_field', array(
            'type'          => 'select',
            'name'          => 'fields['.$key.'][editor-theme]',
            'value'         =>  $field['editor-theme'],
            'choices' => array(
                'dark'      => 'Dark',
                'light'     => 'Light',
            )
        ));

        ?>
    </td>
</tr>
<tr class="field_option field_option_<?php echo $this->name; ?>">
    <td class="label">
        <label><?php _e("Preview Theme",'acf-markdown'); ?></label>
        <p class="description"><?php _e("Select theme to use for the preview.", 'acf-markdown'); ?></p>
    </td>
    <td>
        <?php

        do_action('acf/create_field', array(
            'type'          => 'select',
            'name'          => 'fields['.$key.'][preview-theme]',
            'value'         =>  $field['preview-theme'],
            'choices' => array(
                'github'        => 'GitHub',
                'bartik'        => 'Bartik',
                'preview-dark'  => 'Dark',
            )
        ));

        ?>
    </td>
</tr>
<tr class="field_option field_option_<?php echo $this->name; ?>">
    <td class="label">
        <label><?php _e("Syntax highlighting",'acf-markdown'); ?></label>
        <p class="description"><?php _e("Activate syntax highlighting for code blocks in preview.", 'acf-markdown'); ?></p>
    </td>
    <td>
        <?php

        do_action('acf/create_field', array(
            'type'          => 'radio',
            'name'          => 'fields['.$key.'][syntax-highlight]',
            'value'         =>  $field['syntax-highlight'],
            'layout'        => 'horizontal',
            'choices'       => array(
                '1'         => __('Yes','acf-markdown'),
                '0'         => __('No','acf-markdown'),
            )
        ));

        ?>
    </td>
</tr>
<tr class="field_option field_option_<?php echo $this->name; ?>">
    <td class="label">
        <label><?php _e("Syntax Highlighting Theme",'acf-markdown'); ?></label>
        <p class="description"><?php _e('Select theme to use for syntax highlighting. <a href="https://highlightjs.org/static/test.html" target="_blank">View examples!</a>', 'acf-markdown'); ?></p>
    </td>
    <td>
        <?php

        do_action('acf/create_field', array(
            'type'          => 'select',
            'name'          => 'fields['.$key.'][syntax-theme]',
            'value'         =>  $field['syntax-theme'],
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

        ?>
    </td>
</tr>
<tr class="field_option field_option_<?php echo $this->name; ?>">
    <td class="label">
        <label><?php _e("Show Media Upload Buttons?", 'acf-markdown'); ?></label>
        <p class="description"></p>
    </td>
    <td>
        <?php

        do_action('acf/create_field', array(
            'type'          => 'radio',
            'name'          => 'fields['.$key.'][media-upload]',
            'value'         =>  $field['media-upload'],
            'layout'        => 'horizontal',
            'choices'       => array(
                '1'         => __('Yes','acf-markdown'),
                '0'         => __('No','acf-markdown'),
            )
        ));

        ?>
    </td>
</tr>
        <?php

    }


    /*
    *  create_field()
    *
    *  Create the HTML interface for your field
    *
    *  @param   $field - an array holding all the field's data
    *
    *  @type    action
    *  @since   3.6
    *  @date    23/01/13
    */

    function create_field( $field )
    {
        // defaults?
        $field = array_merge($this->defaults, $field);

        $syntaxHighlight = false;

        if( $field['syntax-highlight'] == '1' ) {
            $syntaxHighlight = true;
            wp_enqueue_script( 'highlightjs' );
        }

        $id = 'editor_' . uniqid();
        $textareaId = $id . '_textarea';


        wp_localize_script( 'acf-input-markdown',  $id, array(
            'containerId' => $id,
            'textareaId' => $textareaId,
            'basePath' => $this->settings['dir'] . "js/lib/EpicEditor-v0.2.2",
            'autogrow' => ($field['autogrow'] == '1'),
            'theme' => array(
                'base' => '/themes/base/epiceditor.css',
                'preview' => "/themes/preview/" . $field["preview-theme"] . ".css?v=1",
                'editor' => "/themes/editor/epic-" . $field["editor-theme"] . ".css?v=1"
            ),
            'syntaxHighlight' => $syntaxHighlight,
            'syntaxTheme' => $this->settings['dir'] . "js/lib/highlight/styles/" . $field['syntax-theme'] . ".css",
            //'tabFunction' => $field['tab-function']
        ));

        wp_enqueue_script( 'acf-input-markdown' );
    ?>
        <?php if( $field['media-upload'] ) { ?>
        <input type="hidden" name="wp-<?php echo $id; ?>-media-input" id="wp-<?php echo $id; ?>-media-input" class="wp-media-input" />
        <div id="wp-<?php echo $id; ?>-media-button" class="wp-media-buttons">
            <?php do_action( 'media_buttons' ); ?>
        </div>
        <?php } ?>
        <input type="hidden" name="<?php echo $field['name']; ?>" id="<?php echo $textareaId; ?>" value="<?php echo $field['value']; ?>" />
        <div id="<?php echo $id; ?>" data-acf-markdown-editor></div>
    <?php
    }


    /*
    *  input_admin_enqueue_scripts()
    *
    *  This action is called in the admin_enqueue_scripts action on the edit screen where your field is created.
    *  Use this action to add CSS + JavaScript to assist your create_field() action.
    *
    *  $info    http://codex.wordpress.org/Plugin_API/Action_Reference/admin_enqueue_scripts
    *  @type    action
    *  @since   3.6
    *  @date    23/01/13
    */

    function input_admin_enqueue_scripts()
    {
        // Note: This function can be removed if not used

        // register ACF scripts
        wp_register_script( 'epiceditor', $this->settings['dir'] . 'js/lib/EpicEditor-v0.2.2/js/epiceditor.min.js', array(), '0.2.2' );
        wp_register_script( 'acf-input-markdown', $this->settings['dir'] . 'js/input.js', array( 'epiceditor', 'acf-input' ), $this->settings['version'] );
        wp_register_script( 'highlightjs', $this->settings['dir'] . 'js/lib/highlight/highlight.pack.js', array(), $this->settings['version'] );

        wp_enqueue_script( 'epiceditor' );

        wp_enqueue_media();

        // register & include CSS
        wp_register_style( 'acf-input-markdown', "{$dir}css/input.css", array(), $this->settings['version'] );
        wp_enqueue_style( 'acf-input-markdown' );
    }


    /*
    *  input_admin_head()
    *
    *  This action is called in the admin_head action on the edit screen where your field is created.
    *  Use this action to add CSS and JavaScript to assist your create_field() action.
    *
    *  @info    http://codex.wordpress.org/Plugin_API/Action_Reference/admin_head
    *  @type    action
    *  @since   3.6
    *  @date    23/01/13
    */

    function input_admin_head()
    {
        // Note: This function can be removed if not used
    }


    /*
    *  field_group_admin_enqueue_scripts()
    *
    *  This action is called in the admin_enqueue_scripts action on the edit screen where your field is edited.
    *  Use this action to add CSS + JavaScript to assist your create_field_options() action.
    *
    *  $info    http://codex.wordpress.org/Plugin_API/Action_Reference/admin_enqueue_scripts
    *  @type    action
    *  @since   3.6
    *  @date    23/01/13
    */

    function field_group_admin_enqueue_scripts()
    {
        // Note: This function can be removed if not used
    }


    /*
    *  field_group_admin_head()
    *
    *  This action is called in the admin_head action on the edit screen where your field is edited.
    *  Use this action to add CSS and JavaScript to assist your create_field_options() action.
    *
    *  @info    http://codex.wordpress.org/Plugin_API/Action_Reference/admin_head
    *  @type    action
    *  @since   3.6
    *  @date    23/01/13
    */

    function field_group_admin_head()
    {
        // Note: This function can be removed if not used
    }


    /*
    *  load_value()
    *
        *  This filter is applied to the $value after it is loaded from the db
    *
    *  @type    filter
    *  @since   3.6
    *  @date    23/01/13
    *
    *  @param   $value - the value found in the database
    *  @param   $post_id - the $post_id from which the value was loaded
    *  @param   $field - the field array holding all the field options
    *
    *  @return  $value - the value to be saved in the database
    */

    function load_value( $value, $post_id, $field )
    {
        // Note: This function can be removed if not used
        return $value;
    }


    /*
    *  update_value()
    *
    *  This filter is applied to the $value before it is updated in the db
    *
    *  @type    filter
    *  @since   3.6
    *  @date    23/01/13
    *
    *  @param   $value - the value which will be saved in the database
    *  @param   $post_id - the $post_id of which the value will be saved
    *  @param   $field - the field array holding all the field options
    *
    *  @return  $value - the modified value
    */

    function update_value( $value, $post_id, $field )
    {
        // Note: This function can be removed if not used
        return $value;
    }


    /*
    *  format_value()
    *
    *  This filter is applied to the $value after it is loaded from the db and before it is passed to the create_field action
    *
    *  @type    filter
    *  @since   3.6
    *  @date    23/01/13
    *
    *  @param   $value  - the value which was loaded from the database
    *  @param   $post_id - the $post_id from which the value was loaded
    *  @param   $field  - the field array holding all the field options
    *
    *  @return  $value  - the modified value
    */

    function format_value( $value, $post_id, $field )
    {
        // defaults?
        /*
        $field = array_merge($this->defaults, $field);
        */

        // perhaps use $field['preview_size'] to alter the $value?


        // Note: This function can be removed if not used
        return $value;
    }


    /*
    *  format_value_for_api()
    *
    *  This filter is applied to the $value after it is loaded from the db and before it is passed back to the API functions such as the_field
    *
    *  @type    filter
    *  @since   3.6
    *  @date    23/01/13
    *
    *  @param   $value  - the value which was loaded from the database
    *  @param   $post_id - the $post_id from which the value was loaded
    *  @param   $field  - the field array holding all the field options
    *
    *  @return  $value  - the modified value
    */

    function format_value_for_api( $value, $post_id, $field )
    {
        // defaults?
        /*
        $field = array_merge($this->defaults, $field);
        */

        // perhaps use $field['preview_size'] to alter the $value?


        // Note: This function can be removed if not used
        return $value;
    }


    /*
    *  load_field()
    *
    *  This filter is applied to the $field after it is loaded from the database
    *
    *  @type    filter
    *  @since   3.6
    *  @date    23/01/13
    *
    *  @param   $field - the field array holding all the field options
    *
    *  @return  $field - the field array holding all the field options
    */

    function load_field( $field )
    {
        // Note: This function can be removed if not used
        return $field;
    }


    /*
    *  update_field()
    *
    *  This filter is applied to the $field before it is saved to the database
    *
    *  @type    filter
    *  @since   3.6
    *  @date    23/01/13
    *
    *  @param   $field - the field array holding all the field options
    *  @param   $post_id - the field group ID (post_type = acf)
    *
    *  @return  $field - the modified field
    */

    function update_field( $field, $post_id )
    {
        // Note: This function can be removed if not used
        return $field;
    }


}


// create field
new acf_field_markdown();

?>
