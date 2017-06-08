<?php
namespace Craft;

const CRAFT_FOLDER = __DIR__.'/../../..';
const CRAFT_PLUGIN_FOLDER = CRAFT_FOLDER.'/plugins';
const UPLOAD_FOLDER = CRAFT_FOLDER."/storage/uploads/gitPlugins";
const CRAFT_CONFIG_GENERAL = CRAFT_FOLDER.'/config/general.php';
const CRAFT_PUBLIC_INDEX = __DIR__.'/../../../../public/index.php';

class GitPlugins_GetService extends BaseApplicationComponent
{

	public function getPlugin($url)
	{
		// Initial state
		$error = false;

		// Check url
		$error = $this->checkUrl($url);

		// Return
		return $error;
	}



	/**
	* @param string $url
	*/
	public function checkUrl($url)
	{
		// Is Github url?
		if (strpos($url, 'github') === false) {
			$error = 'Please enter a Github URL';
			return $error;
		}

		// Determin Download Url
		if (strpos($url, '.zip')) {
			// Set
			$downloadUrl = $url;
		} else {
			// Set
			$downloadUrl = $url;

			if (substr($url, -1) !== '/') {
				$downloadUrl = $downloadUrl.'/';
			}

			$downloadUrl = $downloadUrl.'archive/master.zip';
		}

		// Get filename
		$http_response_header = get_headers($url);
		$realfilename = $this->get_real_filename($http_response_header, $url);

		// Determin Ziptarget and folderTarget
		if (strpos($realfilename, '.zip')) {
			$zipTarget = UPLOAD_FOLDER.'/'.$realfilename;
		} else {
			$zipTarget = UPLOAD_FOLDER.'/'.$realfilename.'-master.zip';
		}

		$folderTarget = str_replace('.zip', '', $zipTarget);

		// Download
		$error = $this->download($zipTarget, $folderTarget, $downloadUrl);

		// return
		return $error;
	}



	/**
	* @param string $zipTarget
	* @param string $folderTarget
	* @param string $downloadUrl
	*/
	public function download($zipTarget, $folderTarget, $downloadUrl)
	{
		$file = @file_get_contents($downloadUrl);

		if ($file) {
			if (!is_dir(UPLOAD_FOLDER)) {
				$error = "Upload folder doesn't exist";
			} else if (!is_writable(UPLOAD_FOLDER)) {
				$error = "Can't write plugin to the upload folder";
			} else {
				file_put_contents($zipTarget, $file);

				$error = $this->extract($zipTarget, $folderTarget);
			}
		} else {
			$error = "Can't download plugin";
		}

		return $error;
	}


	/**
	* @param string $zipTarget
	* @param string $folderTarget
	*/
	public function extract($zipTarget, $folderTarget)
	{
		$date = new DateTime();
		$now = $date->getTimestamp();
		$zip = new \ZipArchive();
		$res = $zip->open($zipTarget);

		if ($res === TRUE) {
			$zip->extractTo(UPLOAD_FOLDER);
			$zip->close();

			$error = $this->move($folderTarget, $zipTarget);
		} else {
			$error = "Can't extract zip";
		}

		return $error;
	}


	/**
	* @param string $uploadFolder
	* @param string $uploadZipFile
	*/
	public function move($uploadFolder, $uploadZipFile)
	{
		$pluginExtractFile = '';
		$pluginExtractFolder = '';

		// Find the folder that the Plugin.php file is in. That is the root of the plugin.
		foreach (glob($uploadFolder."/*Plugin.php") as $filename) {
			$pluginExtractFile = $filename;
			$pluginExtractFolder = dirname($filename);
		}

		if ($pluginExtractFile === '') {
			foreach (glob($uploadFolder."/**/*Plugin.php") as $filename) {
				$pluginExtractFile = $filename;
				$pluginExtractFolder = dirname($filename);
			}
		}

		// Open the file
		$fp = @fopen($pluginExtractFile, 'r');
		if ($fp) {
			$array = explode("\n", fread($fp, filesize($pluginExtractFile)));

			$pluginName = '';

			// Get name of plugin
			foreach ($array as $line) {
				if (strpos($line, 'class') !== false && strpos($line, 'extends') !== false) {
					$split = explode(" ", $line);
					$pluginName = substr($split[1], 0, -6);
					break;
				}
			}

			// Copy to craft/plugins folder.
			$pluginInstallFolder = CRAFT_PLUGIN_FOLDER.'/'.strtolower($pluginName);

			if (!file_exists($pluginInstallFolder)) {
				// Copy folder to craft/plugins
				$this->recurse_copy($pluginExtractFolder, $pluginInstallFolder);

				$error = false;
			}
			else {
				$error = 'The plugin "'.$pluginName.'" is already uploaded.';
			}
		} else {
			$error = 'The uploaded file is not a valid plugin.';
		}

		// Remove zipfile and folder from uploads
		$this->rrmdir($uploadFolder);
		unlink($uploadZipFile);

		return $error;
	}


	/**
	* @param string $dir
	*/
	private function rrmdir($dir)
	{
		foreach (glob($dir.'/{,.}[!.,!..]*', GLOB_MARK|GLOB_BRACE) as $file) {
			if (is_dir($file)) {
				$this->rrmdir($file);
			} else {
				unlink($file);
			}
		}
		rmdir($dir);
	}


	/**
	* @param string $src
	* @param string $dst
	*/
	private function recurse_copy($src, $dst)
	{
		$dir = opendir($src);
		@mkdir($dst);

		while(false !== ( $file = readdir($dir)) ) {
			if (( $file != '.' ) && ( $file != '..' )) {
				if ( is_dir($src . '/' . $file) ) {
					$this->recurse_copy($src . '/' . $file,$dst . '/' . $file);
				} else {
					copy($src . '/' . $file,$dst . '/' . $file);
				}
			}
		}

		closedir($dir);
	}


	/**
	* @param string $to
	*/
	protected function move_uploaded_file($from, $to)
	{
		return move_uploaded_file($from, $to);
	}


	/**
	* @param string $headers
	* @param string $url
	*/
	protected function get_real_filename($headers, $url)
	{
		foreach($headers as $header)
		{
			if (strpos(strtolower($header),'content-disposition') !== false)
			{
				$tmp_name = explode('=', $header);
				if ($tmp_name[1]) {
					return trim($tmp_name[1],'";\'');
				}
			}
		}

		$stripped_url = preg_replace('/\\?.*/', '', $url);
		return basename($stripped_url);
	}
}
