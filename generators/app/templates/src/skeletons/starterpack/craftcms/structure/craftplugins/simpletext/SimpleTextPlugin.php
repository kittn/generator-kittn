<?php
namespace Craft;

/**
 * Simple Text plugin
 */
class SimpleTextPlugin extends BasePlugin
{
	/**
	 * @return string
	 */
	public function getName()
	{
		return 'Simple Text';
	}

	/**
	 * @return string
	 */
	public function getVersion()
	{
		return '1.1';
	}

	/**
	 * @return string
	 */
	public function getSchemaVersion()
	{
		return '1.0.0';
	}

	/**
	 * @return string
	 */
	public function getDeveloper()
	{
		return 'Pixel & Tonic';
	}

	/**
	 * @return string
	 */
	public function getDeveloperUrl()
	{
		return 'http://pixelandtonic.com';
	}

	/**
	 * @return string
	 */
	public function getPluginUrl()
	{
		return 'https://github.com/pixelandtonic/SimpleText';
	}

	/**
	 * @return string
	 */
	public function getDocumentationUrl()
	{
		return $this->getPluginUrl().'/blob/master/README.md';
	}

	/**
	 * @return string
	 */
	public function getReleaseFeedUrl()
	{
		return 'https://raw.githubusercontent.com/pixelandtonic/SimpleText/master/releases.json';
	}
}
