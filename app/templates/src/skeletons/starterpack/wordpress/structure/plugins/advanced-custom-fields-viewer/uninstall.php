<?php

if ( ! defined( 'WP_UNINSTALL_PLUGIN' ) ) {
    exit;
}

// Clean up
delete_option( 'acfv_option_output' );
delete_option( 'acfv_option_color_scheme' );
