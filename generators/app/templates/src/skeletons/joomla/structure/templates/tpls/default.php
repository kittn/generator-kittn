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
?>
<body class="<?php echo $pageclass . ' ' . $this->language; ?>">
<?php if ($this->countModules('header')):?>
<header><jdoc:include type="modules" name="header" style="html5" /></header>
<?php endif;?>
<?php if ($this->countModules('nav')):?>
<nav><jdoc:include type="modules" name="aside" style="none" /></nav>
<?php endif;?>
<div>
<jdoc:include type="message" />
<!-- Component Start -->
<jdoc:include type="component" />
<!-- Component End -->
</div>
<?php if ($this->countModules('aside')):?>
<aside><jdoc:include type="modules" name="aside" style="html5" /></aside>
<?php endif;?>
<?php if ($this->countModules('footer')):?>
<footer><jdoc:include type="modules" name="footer" style="html5" /></footer>
<?php endif;?>
