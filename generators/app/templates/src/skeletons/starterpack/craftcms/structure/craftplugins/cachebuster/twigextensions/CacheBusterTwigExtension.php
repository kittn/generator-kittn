<?php
namespace Craft;

/**
 * Cache Buster Twig Extension
 *
 * @author     Focus Lab, LLC <dev@focuslabllc.com>
 * @copyright  Copyright (c) 2016, Focus Lab, LLC
 * @see        https://github.com/focuslabllc/craftcms-cachebuster
 * @package    cachebuster
 * @version    1.2.2
 */

use Twig_Extension;
use Twig_Filter_Method;
use Twig_Function_Method;

class CacheBusterTwigExtension extends \Twig_Extension
{

	/**
	 * @access    public
	 * @return    string
	 */
	public function getName()
	{
		return 'Cache Buster';
	}



	/**
	 * @access    public
	 * @example   {{ '/path/to/file.css' | cacheBuster }}
	 * @return    array
	 */
	public function getFilters()
	{
		return array(
			'cacheBuster' => new Twig_Filter_Method($this, 'cacheBuster'),
		);
	}



	/**
	 * @access    public
	 * @example   {{ cacheBuster('/path/to/file.css') }}
	 * @return    array
	 */
	public function getFunctions()
	{
		return array(
			'cacheBuster' => new Twig_Function_Method($this, 'cacheBuster'),
		);
	}



	/**
	 * @access    public
	 * @param     $file is the asset path      string
	 * @param     $name is the query string    string
	 * @return    string
	 */
	public function cacheBuster($string, $prefix = false, $name = 'v=')
	{
		return craft()->cacheBuster->bustThatCache($string, $name, $prefix);
	}

}