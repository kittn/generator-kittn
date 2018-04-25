<?php
/**
 * @version 1.0.0
 * @package NNCleanhead
 * @copyright 2015 Niels Nübel
 * @license This software is licensed under the MIT license: http://opensource.org/licenses/MIT
 * @link http://www.niels-nuebel.de
 */

defined('_JEXEC') or die;

/**
 * Plugin class to modify the JDocumentHTML object
 *
 * @since  3.1
 */
class plgSystemKickCleanhead extends JPlugin
{
	protected $app;

	protected $buffer;

	public function onBeforeCompileHead()
	{
		$document = JFactory::getDocument();
		if($this->app->isSite() == false)
		{
			return false;
		}
		elseif($this->app->isSite() == true)
		{
			if($this->app->getTemplate('template')->id == $this->params->get('skiptemplate',''))
				return false;
		}

		// disable js
		if ( $this->params->get('disablejs',false) )
		{
			$fnjs = $this->params->get('fnjs','');
			if (trim($fnjs) != '')
			{
				$filesjs = explode("\n", str_replace("\r", '', $fnjs));
				if ($this->params->get('jui-jquery',0))             $filesjs[] = 'media/jui/js/jquery.min.js';
				if ($this->params->get('jui-jquery-migrate',0))     $filesjs[] = 'media/jui/js/jquery-migrate.min.js';
				if ($this->params->get('jui-jquery-noconflict',0))  $filesjs[] = 'media/jui/js/jquery-noconflict.js';
				if ($this->params->get('jui-bootstrap',0)) {
					$filesjs[] = 'media/jui/js/bootstrap.min.js';
					$filesjs[] = 'media/jui/js/bootstrap.js';
				}
				if ($this->params->get('caption',0))               $filesjs[] = 'media/system/js/caption.js';
				$scripts = array();

				foreach($document->_scripts as $name => $details)
				{
					$add = true;
					foreach ($filesjs as $dis)
					{
						if (strpos($name,$dis) !== false)
						{
							$add = false;
							break;
						}
					}
					if ($add) $scripts[$name] = $details;
				}

				//TODO-NIELS Link path wird mit / vorne gerendert
				$document->_scripts = $scripts;
			}
		}

		//load first
		if ( $this->params->get('loadfirst',false) )
		{
			$firstscript = array();
			$scripts = array();
			foreach($document->_scripts as $name => $details)
			{
				if (strpos($name, $this->params->get('loadfirst')) !== false)
				{
					$firstscript[$name] = $details;
				}
				else {
					$scripts[$name] = $details;
				}
			}
			$newscriptorder = array_merge($firstscript,$scripts);

			$document->_scripts = $newscriptorder;
		}

		// disable css
		if ( $this->params->get('disablecss',false) )
		{
			$fncss = $this->params->get('fncss','');
			if (trim($fncss) != '')
			{
				$filescss = explode("\n", str_replace("\r", '', $fncss));
				$styleSheets = array();

				foreach ($document->_styleSheets as $name => $details)
				{
					$add = true;
					foreach ($filescss as $dis)
					{
						if (strpos($name,$dis) !== false)
						{
							$add = false;
							break;
						}
					}

					if ($add) $styleSheets[$name] = $details;
				}

				$document->_styleSheets = $styleSheets;
			}
		}

		// disable caption
		if ($this->params->get('caption',0) && isset($document->_script['text/javascript']))
		{
			$document->_script['text/javascript'] = str_replace("jQuery(window).on('load',  function() {
				new JCaption('img.caption');
			});",'',$document->_script['text/javascript']);
		}
		$formatLetter = array('||', '//');
		$document->setTitle(str_replace($formatLetter, "", $document->getTitle()));
	}
}
