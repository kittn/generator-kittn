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
<% if (projectjquery === 'slim') { %><script src="//code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha256-k2WSCIexGzOj3Euiig+TlR8gA0EmPjuc79OEeY5L45g=" crossorigin="anonymous"></script><% } %><% if (projectjquery === 'full') { %><script src="//code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script><% } %>

<%% for (var chunk in htmlWebpackPlugin.files.chunks) { if (!chunk.match(/font/)) { %>
<script src="<?= JUri::root(true); ?><%%= htmlWebpackPlugin.files.chunks[chunk].entry %>" defer></script>
<%% }} %>