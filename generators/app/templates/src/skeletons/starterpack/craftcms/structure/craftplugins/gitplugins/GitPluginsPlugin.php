<?php
namespace Craft;

class GitPluginsPlugin extends BasePlugin
{
	protected
		$_version = '0.1.0',
		$_schemaVersion = null,
		$_name = 'gitPlugins',
		$_url = 'https://github.com/AnataCreative/gitPlugins',
		$_releaseFeedUrl = '',
		$_documentationUrl = 'https://github.com/AnataCreative/gitPlugins/blob/master/README.md',
		$_description = '',
		$_developer = 'Anata Creative',
		$_developerUrl = 'https://anatacreative.com/',
		$_minVersion = '2.0';

	public function getName()
	{
		return Craft::t($this->_name);
	}

	public function getUrl()
	{
		return $this->_url;
	}

	public function getVersion()
	{
		return $this->_version;
	}

	public function getDeveloper()
	{
		return $this->_developer;
	}

	public function getDeveloperUrl()
	{
		return $this->_developerUrl;
	}

	public function getDescription()
	{
		return $this->_description;
	}

	public function getDocumentationUrl()
	{
		return $this->_documentationUrl;
	}

	public function getSchemaVersion()
	{
		return $this->_schemaVersion;
	}

	public function getReleaseFeedUrl()
	{
		return $this->_releaseFeedUrl;
	}

	public function getCraftRequiredVersion()
	{
		return $this->_minVersion;
	}

	public function onBeforeInstall()
	{
		if (!file_exists('../craft/storage/uploads/gitPlugins')) {
			mkdir('../craft/storage/uploads/gitPlugins', 0777, true);
		}
	}
}
