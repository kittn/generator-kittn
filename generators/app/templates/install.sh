#!/bin/bash

npm run init<% if (projectusage == "craft" || projectusage == "craftCB") { %>
./craftscripts/set_perms.sh<% } %>
mysql -u<%= credentialdbuser %> -p<%= credentialdbpass %> -h<%= credentialdbserver %> <%= credentialdbdatabase %> < database.sql
clear
echo "Define vhost http://<%= credentialdomain %>"
echo "Open Backend with you Browser http://<%= credentialdomain %>/<% if (projectusage == "wordpress" || projectusage == "wordpressCB") { %>wp-<% } %>admin<% if (projectusage == "joomla" || projectusage == "joomlaCB") { %>istrator<% } %>"
echo "Login with User: 'kittn' | Pass: <% if (projectusage == "wordpress" || projectusage == "wordpressCB") { %>kittn<% } else { %>superkittn<% } %>"<% if (projectusage == "craftCB") { %>
echo "If you want to use the Craft Personal version, you must deactivate the localization before you switch."<% } %>
echo "Activate Dev-Task with 'npm run dev'"
