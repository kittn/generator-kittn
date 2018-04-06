<?php
/**
 * MN Twig Perversion plugin for Craft CMS
 *
 * Making twig do things it really shouldn't
 *
 *
 * @author    Marion Newlevant
 * @copyright Copyright (c) 2016 Marion Newlevant
 * @link      http://marion.newlevant.com
 * @package   MnTwigPerversion
 * @since     1.0.0
 */

namespace Craft;

class MnTwigPerversionPlugin extends BasePlugin
{

	/**
	 * Returns the user-facing name.
	 *
	 * @return mixed
	 */
	public function getName()
	{
		 return Craft::t('MN Twig Perversion');
	}

	/**
	 * Plugins can have descriptions of themselves displayed on the Plugins page by adding a getDescription() method
	 * on the primary plugin class:
	 *
	 * @return mixed
	 */
	public function getDescription()
	{
		return Craft::t('Making twig do things it really shouldn\'t');
	}

	/**
	 * Plugins can have links to their documentation on the Plugins page by adding a getDocumentationUrl() method on
	 * the primary plugin class:
	 *
	 * @return string
	 */
	public function getDocumentationUrl()
	{
		return 'https://github.com/marionnewlevant/craft-twig_perversion';
	}

	/**
	 * Plugins can now take part in Craft’s update notifications, and display release notes on the Updates page, by
	 * providing a JSON feed that describes new releases, and adding a getReleaseFeedUrl() method on the primary
	 * plugin class.
	 *
	 * @return string
	 */
	public function getReleaseFeedUrl()
	{
		return 'https://raw.githubusercontent.com/marionnewlevant/craft-twig_perversion/master/releases.json';
	}

	/**
	 * Returns the version number.
	 *
	 * @return string
	 */
	public function getVersion()
	{
		return '1.3.0';
	}

	/**
	 * As of Craft 2.5, Craft no longer takes the whole site down every time a plugin’s version number changes, in
	 * case there are any new migrations that need to be run. Instead plugins must explicitly tell Craft that they
	 * have new migrations by returning a new (higher) schema version number with a getSchemaVersion() method on
	 * their primary plugin class:
	 *
	 * @return string
	 */
	public function getSchemaVersion()
	{
		return '1.0.0';
	}

	/**
	 * Returns the developer’s name.
	 *
	 * @return string
	 */
	public function getDeveloper()
	{
		return 'Marion Newlevant';
	}

	/**
	 * Returns the developer’s website URL.
	 *
	 * @return string
	 */
	public function getDeveloperUrl()
	{
		return 'http://marion.newlevant.com';
	}

	/**
	 * Returns whether the plugin should get its own tab in the CP header.
	 *
	 * @return bool
	 */
	public function hasCpSection()
	{
		return false;
	}

	/**
	 * Add any Twig extensions.
	 *
	 * @return mixed
	 */
	public function addTwigExtension()
	{
		Craft::import('plugins.mntwigperversion.twigextensions.MnTwigPerversionTwigExtension');

		Craft::import('plugins.mntwigperversion.twigextensions.MnTwigPerversion_Break_Node');
		Craft::import('plugins.mntwigperversion.twigextensions.MnTwigPerversion_Break_TokenParser');

		Craft::import('plugins.mntwigperversion.twigextensions.MnTwigPerversion_Continue_Node');
		Craft::import('plugins.mntwigperversion.twigextensions.MnTwigPerversion_Continue_TokenParser');

		Craft::import('plugins.mntwigperversion.twigextensions.MnTwigPerversion_Return_Node');
		Craft::import('plugins.mntwigperversion.twigextensions.MnTwigPerversion_Return_TokenParser');
		// Craft::import('plugins.mntwigperversion.twigextensions.NumericTest');

		return new MnTwigPerversionTwigExtension();
	}
}
