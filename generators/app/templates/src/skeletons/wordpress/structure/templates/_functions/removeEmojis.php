<?php
/*
 * Remove emojis JavaScript
 */
function remove_emoji()
{
    remove_action('wp_head', 'print_emoji_detection_script', 7);
    remove_action('admin_print_scripts', 'print_emoji_detection_script');
    remove_action('admin_print_styles', 'print_emoji_styles');
    remove_action('wp_print_styles', 'print_emoji_styles');
    remove_filter('the_content_feed', 'wp_staticize_emoji');
    remove_filter('comment_text_rss', 'wp_staticize_emoji');
    remove_filter('wp_mail', 'wp_staticize_emoji_for_email');
    add_filter('tiny_mce_plugins', 'remove_tinymce_emoji');
}
add_action('init', 'remove_emoji');

function remove_tinymce_emoji($plugins)
{
    if (!is_array($plugins)) {
        return array();
    }
    return array_diff($plugins, array(
        'wpemoji'
    ));
}
