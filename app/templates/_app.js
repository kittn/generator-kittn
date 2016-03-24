// Main JS File
import modernizrLoad from './partial/modernizer-loader.js'
import conditionizrInit from './partial/conditionizr-init.js'<% if (projectquery == 'ElementQuery') { %>
import eq from 'css-element-queries'<% } else { %>
import cq from 'cq-prolyfill'

cq({postcss: true})<% } %>
