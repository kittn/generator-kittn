<?php
/**
 * <%= moduleName %>
 * =================
 * Description
 *
 * @param $c = Classname
 */

?>

<?php // Build Element Block ?>
<div class="<% if(moduleType === 'cb') { %>c<% } else { %><%= moduleType %><% } %>-<%= moduleName %>">
  <%= moduleName %>
</div>
