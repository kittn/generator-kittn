<?php
/**
 * Plugin Name: Advanced Custom Fields: Link
 * Description: Allows you to choose a link to an existing piece of content, or enter your own
 * Author:      Corey Worrell, EMRL
 * Author URI:  http://emrl.com
 * Version:     1.1.6
 */
add_action('acf/include_field_types', function ($version) {
    include 'src/FieldLink.php';
    new Emrl\AcfLink\FieldLink(__FILE__);
});

// Third party plugin support
add_action('admin_init', function () {
    if (class_exists('ACA_ACF_Field') && ! class_exists('ACA_ACF_Field_Link')) {
        include 'src/Support/AdminColumns/FieldLink.php';
        class_alias('Emrl\Acflink\Support\AdminColumns\FieldLink', 'ACA_ACF_Field_Link');
    }
});
