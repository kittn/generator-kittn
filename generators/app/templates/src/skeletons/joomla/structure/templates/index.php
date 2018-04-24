<?php
/**
 * <%= projectname.toUpperCase() %>
 *
 * @package     Joomla.Site
 * @subpackage  Templates.<%= projectname %>
 *
 * @author      <%= projectauthor %> <<%= projectmail %>>
 * @copyright   Copyright (c) 2018 <%= projectname %>
 * @license     GNU General Public License version 2 or later
 */

defined('_JEXEC') or die;

$app             = JFactory::getApplication();
$doc             = JFactory::getDocument();
$user            = JFactory::getUser();
$this->language  = $doc->language;
$this->direction = $doc->direction;

// Getting params from template
$params = $app->getTemplate(true)->params;

// Template Params
$tpath              = $this->baseurl . '/templates/' . $this->template;
$layout             = $params->get('layout', 'default.php');
$pageclass          = $app->getParams()->get('pageclass_sfx');
$hidecontentwrapper = $params->get('hidecontentwrapper', 0);
$showsystemoutput   = $params->get('showsystemoutput', 1);

// Reset Generator tag
$this->setGenerator(null);

// Fix Cache Problems
$modified_css = filemtime(__DIR__ . '/assets/css/<%= projectcssfilename %>.css');

// Add Stylesheets
JHtml::_('stylesheet', '<%= projectcssfilename %>.css', array('version' => $modified_css, 'relative' => true));

// Load Critical CSS
if (file_exists($criticalcss = __DIR__ . '/_critical/' . str_replace('.php', '', $layout) . '_critical.min.css'))
{
	$doc->addStyleDeclaration(file_get_contents($criticalcss));
}

$doc->setMetaData('viewport', 'width=device-width, user-scalable=yes, initial-scale=1');
$doc->setMetaData('format-detection', 'telephone=no');

// Deactivate Progress Load on Livepreview
// $doc->addScriptDeclaration("document.getElementsByTagName('html')[0].classList.add('plj');");
?>
<!DOCTYPE html>
<html lang="<?php echo $this->language; ?>" dir="<?php echo $this->direction; ?>">
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<jdoc:include type="head"/>
<?php require_once __DIR__ . '/_parts/favicon.php'; ?>
</head>
<body>
<?php require_once __DIR__ . '/tpls/' . $layout; ?>
<jdoc:include type="modules" name="debug"/>
<?php require_once __DIR__ . '/_parts/footer.php'; ?>
</body>
</html>
