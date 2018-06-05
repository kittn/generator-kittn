<?php
/**
 * Class Kint_Debug_Bar_Panel
 */
class Kint_Debug_Bar_Panel extends Debug_Bar_Panel {
	var $_visible = true;

	function title( $title = null ) {
		return __( 'Kint Debugger' );
	}

	function prerender() {
		$this->set_visible( apply_filters( 'kint_debug_display', true ) );
	}

	function is_visible() {
		return $this->_visible;
	}

	function set_visible( $visible ) {
		$this->_visible = $visible;
	}

	function render() {
		global $kint_debug;
		if ( is_array( $kint_debug ) ) {
			foreach ( $kint_debug as $line ) {
				echo $line;
			}
		}
	}
}
