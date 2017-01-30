<?php

function add_frontend_viewer(){

	global $acfv;

	if ( !is_user_logged_in() || !current_user_can('activate_plugins') ) {
		return;
	}

	$defaults = array( 'output' => 'print_r' );
	$output = get_option( 'acfv_option_output', $defaults );

	$acfv_fields = get_fields();
	$acfv_fields_option = get_fields( 'option' );

	$acfv_adminbar = is_admin_bar_showing() ? 'adminbar-visible' : '';

	$plugin_dir = current( explode( "/", plugin_basename( __FILE__ ) ) );

	?>

	<span id="acfv-toggle" class="acfv-btn <?php echo $acfv_adminbar; ?>">
		<svg class="acfv-btn-icon" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="864px" height="864px" viewBox="28.749 -42.001 864 864" enable-background="new 28.749 -42.001 864 864" xml:space="preserve">
			<path d="M769.487,350.976c-8.496-9.407-99.998-83.782-116.354-88.59c-7.117-2.066-14.271-3.359-21.666-3.901    c-34.199-2.504-71.926,8.215-95.699,33.838c-2.072,2.233-3.258,3.509-3.258,3.509s0.887-1.507,2.436-4.146    c7.332-12.363,18.016-23.099,29.453-31.695c5.273-3.961,10.855-7.506,16.686-10.586c1.6-0.844,16.467-8.877,17.467-7.824    c-0.002-0.002-8.117-8.559-8.117-8.559c-13.049-13.051-27.168-24.3-46.395-24.3c-23.83,0-44.195,14.775-52.48,35.657    c-7.029-5.225-18.213-8.606-30.812-8.606c-12.599,0-23.782,3.381-30.813,8.606c-8.284-20.882-28.649-35.657-52.48-35.657    c-19.227,0-33.346,11.249-46.395,24.299c0,0-8.114,8.557-8.116,8.559c0.999-1.054,15.866,6.979,17.465,7.824    c5.83,3.08,11.413,6.626,16.686,10.587c11.44,8.595,22.121,19.332,29.454,31.694c1.55,2.639,2.435,4.146,2.435,4.146    s-1.184-1.276-3.256-3.509c-23.774-25.623-61.5-36.342-95.699-33.838c-7.395,0.542-14.549,1.835-21.666,3.901    c-16.356,4.809-107.858,79.183-116.353,88.59c-24.555,27.19-39.51,63.218-39.51,102.741c0,84.691,68.658,153.351,153.351,153.351    c77.476,0,141.521-57.459,151.876-132.088c12.074,8.797,26.94,13.992,43.022,13.992c16.082,0,30.947-5.195,43.021-13.992    c10.355,74.627,74.4,132.088,151.877,132.088c84.693,0,153.352-68.66,153.352-153.351    C808.997,414.193,794.042,378.167,769.487,350.976z M262.449,550.032c-51.075,0-92.479-41.406-92.479-92.479    c0-51.075,41.405-92.479,92.479-92.479c51.075,0,92.479,41.404,92.479,92.479C354.928,508.626,313.524,550.032,262.449,550.032z     M460.748,448.866c-13.472,0-24.393-10.922-24.393-24.393c0-13.472,10.921-24.393,24.393-24.393    c13.472,0,24.392,10.922,24.392,24.393S474.22,448.866,460.748,448.866z M659.046,550.032c-51.074,0-92.479-41.406-92.479-92.479    c0-51.075,41.404-92.479,92.479-92.479c51.076,0,92.48,41.404,92.48,92.479C751.526,508.626,710.122,550.032,659.046,550.032z"/>
		</svg>
	</span>

	<div id="acfv-click-layer"></div>
	<div id="acfv-wrap" class="<?php echo $acfv_adminbar; ?>">
		<table>
			<tr>
				<td class="acfv-btn-col">
					<span id="acfv-btn-close" class="acfv-btn">Close</span>
					<div class="acfv-spacer"></div>
					<?php if ( $acfv != NULL ) : ?>
						<span id="acfv-btn-custom" class="acfv-btn">Custom</span>
					<?php endif; ?>

					<span id="acfv-btn-current" class="acfv-btn">Current Page</span>
					<span id="acfv-btn-options" class="acfv-btn">Options Page</span>
					<div class="acfv-footer">
						<a href="<?php echo admin_url( '/options-general.php?page=' . $plugin_dir . '%2Fadmin%2Foptions.php' ); ?>" class="acfv-link">
							<span class="dashicons dashicons-admin-generic"></span>
						</a>
						<a href="<?php echo admin_url(); ?>" class="acfv-link">
							<span class="dashicons dashicons-dashboard"></span>
						</a>
					</div>
				</td>
				<td>
					<pre id="acfv-current-viewer"><?php
						if ( $output['output'] == 'print_r' ) {
							print_r( $acfv_fields );
						} elseif( $output['output'] == 'var_dump' ) {
							var_dump( $acfv_fields );
						} else {
							echo 'No option has been selected.';
						}
					?></pre>
					<pre id="acfv-options-viewer"><?php
						if ( $output['output'] == 'print_r' ) {
							print_r( $acfv_fields_option );
						} elseif( $output['output'] == 'var_dump' ) {
							var_dump( $acfv_fields_option );
						} else {
							echo 'No option has been selected.';
						}
					?></pre>
					<?php if ($acfv != NULL) : ?>
						<pre id="acfv-custom-viewer"><?php
							if ( $output['output'] == 'print_r' ) {
								print_r($acfv);
							} elseif( $output['output'] == 'var_dump' ) {
								var_dump($acfv);
							} else {
								echo 'No option has been selected.';
							}
						?></pre>
					<?php endif; ?>
			    	</td>
			</tr>
		</table>
    </div>
<?php
}
add_action( 'wp_footer','add_frontend_viewer' );

function acfv_frontend_scripts_and_styles() {

	$theme = get_option( 'acfv_option_color_scheme' );

	if ( $theme['theme'] == 'transparent' ) {
        wp_enqueue_style( 'acfv_theme_transparent', plugins_url( '/themes/transparent.css' , __FILE__ ) );
	} elseif ( $theme['theme'] == 'light' ) {
		wp_enqueue_style( 'acfv_theme_light', plugins_url( '/themes/light.css' , __FILE__ ) );
	} else {
		wp_enqueue_style( 'acfv_theme_dark', plugins_url( '/themes/dark.css' , __FILE__ ) );
	}

	wp_enqueue_style( 'dashicons' );
	wp_enqueue_script( 'acfv_frontend_js', plugins_url( '/js/acfv-frontend.js', __FILE__ ),array('jquery'),'',true );

}
add_action( 'wp_enqueue_scripts', 'acfv_frontend_scripts_and_styles' );
