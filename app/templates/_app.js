// Main JS File
import modernizrLoad from './src/js/partial/modernizer-loader.js'
import conditionizrInit from './src/js/partial/conditionizr-init.js'<% if (projectquery == 'ElementQuery') { %>
import eq from 'css-element-queries'<% } else { %>
import cq from 'cq-prolyfill'

cq({postcss: true})<% } %>
