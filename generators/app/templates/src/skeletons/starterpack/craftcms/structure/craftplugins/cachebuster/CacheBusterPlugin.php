<?php
namespace Craft;

/**
 * Cache Buster Plugin
 *
 * @author     Focus Lab, LLC <dev@focuslabllc.com>
 * @copyright  Copyright (c) 2016, Focus Lab, LLC
 * @see        https://github.com/focuslabllc/craftcms-cachebuster
 * @package    cachebuster
 * @version    1.2.2
 */
class CacheBusterPlugin extends BasePlugin
{
	/**
	 * @access    public
	 * @return    string
	 */
	public function getName()
	{
		return Craft::t('Cache Buster');
	}



	/**
	 * @access    public
	 * @return    string
	 */
	public function getVersion()
	{
		return '1.2.2';
	}



	/**
	 * @access    public
	 * @return    string
	 */
	public function getDeveloper()
	{
		return 'Focus Lab, LLC';
	}



	/**
	 * @access    public
	 * @return    string
	 */
	public function getDeveloperUrl()
	{
		return 'http://focuslabllc.com';
	}



	/**
	 * @access    public
	 * @return    string
	 */
	public function getDocumentationUrl() {
		return 'https://github.com/focuslabllc/craftcms-cachebuster/blob/master/readme.md';
	}



	/**
	 * @access    public
	 * @return    string
	 */
	public function getReleaseFeedUrl() {
		return 'https://raw.githubusercontent.com/focuslabllc/craftcms-cachebuster/master/changelog.json';
	}



	/**
	 * @access    public
	 * @return    bool
	 */
	public function hasCpSection()
	{
		return false;
	}



	/**
	 * @access    public
	 * @return    object
	 */
	public function addTwigExtension()
	{
		Craft::import('plugins.cachebuster.twigextensions.CacheBusterTwigExtension');
		return new CacheBusterTwigExtension();
	}

}