#!/bin/bash

npm run init<% if (projectusage == "craft" || projectusage == "craftCB") { %>
./craftscripts/set_perms.sh<% } %>
mysql -u<%= credentialdbuser %> -p<%= credentialdbpass %> -h<%= credentialdbserver %> <%= credentialdbdatabase %> < database.sql
clear
echo "Define vhost http://<%= credentialdomain %>"
echo "Open Backend with you Browser http://<%= credentialdomain %>/<% if (projectusage == "wordpress" || projectusage == "wordpressCB") { %>wp-<% } %>admin"
echo "Login with User: 'kitten' | Pass: <% if (projectusage == "wordpress" || projectusage == "wordpressCB") { %>kittn<% } else { %>superkittn<% } %>"
echo "Activate Dev-Task with 'npm run dev'"
