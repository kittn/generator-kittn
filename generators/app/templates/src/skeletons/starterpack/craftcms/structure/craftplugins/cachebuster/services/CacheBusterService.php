<?php
namespace Craft;

/**
 * Cache Buster Service
 *
 * @author     Focus Lab, LLC <dev@focuslabllc.com>
 * @copyright  Copyright (c) 2016, Focus Lab, LLC
 * @see        https://github.com/focuslabllc/craftcms-cachebuster
 * @package    cachebuster
 * @version    1.2.2
 */

class CacheBusterService extends BaseApplicationComponent
{

	/**
	 * Primary cache busting router
	 *
	 * @param     $file is the asset path      string
	 * @param     $name is the query string    mixed
	 * @access    public
	 * @return    string
	 */
	public function bustThatCache($file, $name = false, $prefix = false)
	{
		// If we have a manifest file and if the manifest object
		// contains a key for our file, we'll just serve that value and be done
		if (craft()->config->get('assetManifest', 'cachebuster'))
		{
			return $this->runPrefix($prefix, $this->tryManifest($file, $name));
		}
		else
		{
			return $this->runPrefix($prefix, $this->tryQueryString($file, $name));
		}

	}
	// End function bustThatCache()



	// --------------------------------------------------------



	/**
	 * Look for a manifest of assets and revved assets
	 *
	 * @param     $file is the asset path      string
	 * @param     $name is the query string    mixed
	 * @access    public
	 * @return    string
	 */
	private function tryManifest($file, $name = false)
	{
		$assetManifest = craft()->config->get('assetManifest', 'cachebuster');
		$manifestFile = realpath(CRAFT_BASE_PATH . '../' . $assetManifest);

		// realpath() returns false if it couldn't find a file. If we don't have
		// a file we can go ahead and default to our query string cache busting

		if (! $manifestFile)
		{
			CacheBusterPlugin::log('Could not find manifest file (value provided was \'' . $assetManifest . '\')', LogLevel::Error);

			return $this->tryQueryString($file, $name);
		}

		// We made it here so let's parse the file as json
		$manifest = $this->manifestToArray($manifestFile);

		// See if we have a key with our file path
		if (isset($manifest[$file]))
		{
			return $manifest[$file];
		}

		/**
		 * Maybe the asset manifest does the opposite of what the developer/team does in terms of
		 * leading slashes in file paths. So let's just double check we don't have a key that might
		 * be the same but different.
		 *
		 * Example, in my template I may have used {{ cacheBuster('/css/site.css') }}
		 * but my manifest might have the key of 'css/site.css'
		 */
		if (substr($file, 0, 1) === '/')
		{
			if (isset($manifest[ltrim($file, '/')]))
			{
				return $manifest[ltrim($file, '/')];
			}
		}
		else
		{
			if (isset($manifest['/' . $file]))
			{
				return $manifest['/' . $file];
			}
		}


		// If we made it this far, our manifest options didn't work out. So we'll fall back to query string
		return $this->tryQueryString($file, $name);

	}
	// End function tryManifest()



	/**
	 * Add a query string for cache busting
	 *
	 * @param     $file is the asset path      string
	 * @param     $name is the query string    mixed
	 * @access    public
	 * @return    string
	 */
	private function tryQueryString($file, $name = false)
	{
		/**
		 * If the plugin's config has a queryString value in either
		 * craft/plugins/cachebuster/config.php OR craft/config/cachebuster.php
		 * then we'll use that same query string for all cache busting need
		 * and avoid any and all time checks on files.
		 * A way this could be useful is if you update the queryString config
		 * value with a commit hash or something unique to a build or deployment
		 */
		if(craft()->config->get('queryString', 'cachebuster'))
		{
			return $file . '?' . craft()->config->get('queryString', 'cachebuster');
		}

		/**
		 * If there wasn't a queryString config setting we'll do a
		 * time check on the file (if the path is correct) and return
		 * a cache busting string as a result
		 */

		// We'll default to using any argument passed from Twig for a query string
		if ($name)
		{
			$queryString = $name;
		}
		// Or we just default to the following query string if there was no argument
		else
		{
			$queryString = 'v=';
		}

		$separator = '?' . $queryString;
		// todo: should I be grabbing the root differently?
		$rootPath  = $_SERVER['DOCUMENT_ROOT'];
		$filePath  = realpath($rootPath . $file);

		if (! $filePath)
		{
			CacheBusterPlugin::log('Could not find your asset file (value provided was \'' . $file . '\' and we looked for the file at \'' . $rootPath . $file . '\')', LogLevel::Error);
			return $file;
		}

		$time = filemtime($filePath);

		if ($time !== FALSE)
		{
			$file .= $separator . $time;
		}

		return $file;
	}
	// End function tryQueryString()



	/**
	 * Grab manifest and convert to array
	 *
	 * @param     $manifestPath is the path to the manifest file    string
	 * @access    public
	 * @return    mixed
	 */
	private function manifestToArray($manifestPath = false)
	{
		if (! $manifestPath)
		{
			return false;
		}

		$manifest = json_decode(file_get_contents($manifestPath), true);

		if (! is_array($manifest))
		{
			CacheBusterPlugin::log('Could not decode json from manifest file. Double check the contents of \'' . $manifestPath . '\'.', LogLevel::Error);
		}

		return $manifest;
	}
	// End function manifestToArray()



	/**
	 * Prepend a prefix string
	 *
	 * If a prefix argument is passed to the variable/tag/function in twig
	 * then we'll add that to the beginning of the string. If one isn't passed,
	 * we'll check for an assetPrefix config item (which may be used if ALL assets
	 * should be returned with the same prefix). If there is not prefix, just return
	 * the file as-is.
	 *
	 * @param     $prefix    string
	 * @param     $file      string
	 * @access    private
	 * @return    string
	 */
	private function runPrefix($prefix = false, $file)
	{
		if (! $prefix AND craft()->config->get('assetPrefix', 'cachebuster'))
		{
			$prefix = craft()->config->get('assetPrefix', 'cachebuster');
		}
		return ($prefix) ? $prefix . $file : $file ;
	}

}