<?php
namespace Craft;

/**
 * Cache Buster Variables
 *
 * @author     Focus Lab, LLC <dev@focuslabllc.com>
 * @copyright  Copyright (c) 2016, Focus Lab, LLC
 * @see        https://github.com/focuslabllc/craftcms-cachebuster
 * @package    cachebuster
 * @version    1.2.2
 */
class CacheBusterVariable
{
	/**
	 * Craft plugin variable
	 *
	 * @param     $file is the asset path      string
	 * @param     $name is the query string    string
	 * @example   {{ craft.cacheBuster.bust('/css/site.css') }}
	 * @access    public
	 * @return    string
	 */
	public function bust($string, $prefix = false, $name = 'v=')
	{
		return craft()->cacheBuster->bustThatCache($string, $name, $prefix);
	}

}