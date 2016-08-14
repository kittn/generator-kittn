// Main JS File
import modernizrLoad from './partial/modernizer-loader.js'
import conditionizrInit from './partial/conditionizr-init.js'<% if (projectquery == 'ElementQuery') { %>
import eq from 'css-element-queries'<% } else { %>
import cq from 'cq-prolyfill'<% if (projectvue == true ) { %>
import Vue from 'vue'

// Vue Twig Delimiters
Vue.config.delimiters = ['@{','}']
Vue.config.unsafeDelimiters = ['@@{', '}']

Vue.use(vueResource)<% } %>

cq({postcss: true})<% } %><% if (projectvue == true ) { %>

new Vue({
  el: '#app',

  components: {

  }

});<% } %>
