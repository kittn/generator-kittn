<?php
	
	namespace Craft;
	
	use Twig_Extension;
	use Twig_Filter_Method;
	
	define("VIMEO",'vimeo.com');
	define("YOUTUBE",'youtube.com');
	define("YOUTUBE_SHORT",'youtu.be');
	define("FACEBOOK",'facebook.com');
	
	class VideoEmbedUtilityTwigExtension extends Twig_Extension {
		
		private static $KNOWN_HOSTS = array(VIMEO,YOUTUBE,YOUTUBE_SHORT,FACEBOOK);
		
		public function getFilters() {
			return array(
				'videoPlayerUrl' => new Twig_Filter_Method($this,'videoPlayerUrl'),
				'videoEmbed' => new Twig_Filter_Method($this,'videoEmbed'),
				'videoHost' => new Twig_Filter_Method($this,'videoHost')
			);
		}
		/**
		 * Returns a string indicating where this video is hosted (youtube, vimeo, etc.)
		 *
		 * @param string $videoUrl
		 * @return string
		 */
		public function videoHost($videoUrl) {
			$host = parse_url($videoUrl, PHP_URL_HOST);
			// return a sanitized value (no leading www, etc) if it's one we know.
			foreach($this::$KNOWN_HOSTS as $known) {
				if( strpos($videoUrl,$known) !== FALSE ) {
					return $known;
				}
			}
			return $host;
		}
				
		public function videoId($videoUrl) {
			$host = $this->videoHost($videoUrl);
			switch($host) {
				case VIMEO:
					if(preg_match('/\/([0-9]+)\/*(\?.*)?$/',$videoUrl,$matches) !== false) {
						return $matches[1];
					}
				break;
				
				case YOUTUBE:
				case YOUTUBE_SHORT:
					if(preg_match('%(?:youtube(?:-nocookie)?\.com/(?:[^/]+/.+/|(?:v|e(?:mbed)?)/|.*[?&]v=)|youtu\.be/)([^"&?/ ]{11})%i',$videoUrl,$matches) !== false)
						return $matches[1];
				break;
			}
			return "";
		}
		
		public function videoPlayerUrl($input) {
			$videoId = $this->videoId($input);
			switch($this->videoHost($input)) {
				case VIMEO:
					return "//player.vimeo.com/video/$videoId?";
				break;
				
				case YOUTUBE:
				case YOUTUBE_SHORT:
					return "//www.youtube.com/embed/$videoId?controls=2";
				break;

				case FACEBOOK:
					return '//www.facebook.com/plugins/video.php?href=' . urlencode($input) . '&show_text=0';
				break;
			}
			return "";
		}
		
		/**
		* Returns a boolean indicating whether the string $haystack ends with the string $needle.
		* @param string $haystack the string to be searched
		* @param string $needle the substring we're looking for
		* return boolean
		*/
		private function endsWith($haystack, $needle) {
			return $needle === "" || substr($haystack, -strlen($needle)) === $needle;
		}
		
		public function videoEmbed($input, $options = array()) {
			$width = '100%';
			$height = '148';
			$url = $this->videoPlayerUrl($input);
			
			if(!empty($url)) {
				if(!empty($options)) {
					if(isset($options['width'])) {
						$width = $options['width'];
						unset($options['width']);
					}
					
					if(isset($options['height'])) {
						$height = $options['height'];
						unset($options['height']);
					}
					
					$url .= '&' . http_build_query($options);
				}
				
				$originalPath = craft()->path->getTemplatesPath();
				$myPath = craft()->path->getPluginsPath() . 'videoembedutility/templates/';
				craft()->path->setTemplatesPath($myPath);
				$markup = craft()->templates->render('_vimeoEmbed.html', array(
					'player_url' => $url,
					'width' => $width,
					'height' => $height
				));
				craft()->path->setTemplatesPath($originalPath);
				return TemplateHelper::getRaw($markup);
			}
		}
		
		public function getName() {
			return 'Video Embed Utility Twig Extension';
		}
	}
	
?>
