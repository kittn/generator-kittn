#!/bin/bash

npm run init<% if (projectusage == "craft" || projectusage == "craftCB") { %>
./craftscripts/set_perms.sh<% } %>
mysql -u<%= credentialdbuser %> -p<%= credentialdbpass %> <%= credentialdbdatabase %> < database.sql
clear
echo "Define vhost http://<%= credentialdomain %>"
echo "Open Backend with you Browser http://<%= credentialdomain %>/<% if (projectusage == "wordpress" || projectusage == "wordpressCB") { %>wp-<% } %>admin"
echo "Activate Devtask with 'npm run dev'"
