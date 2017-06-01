<?php

	namespace Craft;
	
	class VideoEmbedUtilityPlugin extends BasePlugin {

		public function addTwigExtension() {
			Craft::import('plugins.videoembedutility.twigextensions.VideoEmbedUtilityTwigExtension');
			return new VideoEmbedUtilityTwigExtension();
		}
		
		public function getName() {
			return Craft::t('Video Embed Utility');
		}

		public function getVersion() {
			return '1.0.0';
		}
				
		function getDeveloper() {
			return 'Staplegun Design, Inc.';
		}
		
		function getDeveloperUrl() {
			return 'http://staplegun.us';
		}
		
	}

?>
