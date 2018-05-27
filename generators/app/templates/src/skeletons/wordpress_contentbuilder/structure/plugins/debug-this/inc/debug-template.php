<?php
defined('ABSPATH') || die();

#Render the entire page to buffer to process to log all actions and filters
ob_start();?>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title><?php _e('Debug This', 'debug-this');?></title>
	<?php wp_head();?>
</head>
<body>
<div class='debug-this'>
	<a href="/<?php echo Debug_This::get_escape_url();?>" class="escape"><span class="dashicons dashicons-dismiss"></span></a>
	<div class='debug'>
		%DEBUG%
	</div>
	<script>
		var anchors = document.querySelectorAll('a[href^="#"]')
		for (var i = 0; i < anchors.length; i++) {
			anchors[i].addEventListener('click', function(e) {
				e.preventDefault();
				var h = this.hash.substr(1)
				var target = document.getElementsByName(h)[0]
				var top = target.offsetTop;
				window.scrollTo(0, top);

				if (history.pushState) {
					history.pushState(null, '', this.hash);
				} else {
					location.hash = this.hash;
				}
			})
		}
	</script>
	<?php wp_footer();?>
</div>
</body>
</html>
<?php
$html = ob_get_contents();
ob_get_clean();

#Render debug_this action buffer
ob_start();
do_action('debug_this', Debug_This::$mode);
$debug = ob_get_contents();
ob_get_clean();

#Output HTML with included $debug markup
$html = str_replace('%DEBUG%', $debug, $html);
echo $html;