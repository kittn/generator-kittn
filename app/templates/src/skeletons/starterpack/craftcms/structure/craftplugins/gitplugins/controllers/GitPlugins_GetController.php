<?php
namespace Craft;

class GitPlugins_getController extends BaseController
{
	public function actionGetPlugin()
	{
		$url = craft()->request->getPost('url');

		$error = craft()->gitPlugins_get->getPlugin($url);

		if ($error) {
			craft()->userSession->setNotice(Craft::t($error));
		} else {
			craft()->userSession->setNotice(Craft::t('Plugin downloaded'));
		}
	}
}
