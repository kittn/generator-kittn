<?php

function acfv_plugin_row_meta( $links, $file ) {
	if ( strpos( $file, 'acfv.php' ) !== false ) {
		$new_links = array(
			'<a href="https://github.com/josephfusco/advanced-custom-fields-viewer" target="_blank">GitHub</a>'
		);
		$links = array_merge( $links, $new_links );
	}
	return $links;
}
add_filter( 'plugin_row_meta', 'acfv_plugin_row_meta', 10, 2 );
