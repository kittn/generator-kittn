// Main JS File
import modernizrLoad from './partial/modernizer-loader.js'
import conditionizrInit from './partial/conditionizr-init.js'<% if (projectquery == 'ElementQuery') { %>
import eq from 'css-element-queries'<% } else { %>
import cq from 'cq-prolyfill'<%; if (projectvue == true ) { %>
import Vue from 'vue'
import VueResource from 'vue-resource'
import VueRouter from 'vue-router'

// Vue Twig Delimiters
Vue.config.delimiters = ['@{','}'];
Vue.config.unsafeDelimiters = ['@@{', '}'];

Vue.use(VueResource);
Vue.use(VueRouter)<% } %>

// Init Container Queries
cq({postcss: true})<% } %><% if (projectvue == true ) { %>

new Vue({
  el: '#app',

  components: {

  }

});<% } %>
