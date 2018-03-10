// http://eslint.org/docs/user-guide/configuring

module.exports = {
  root: true,
  parserOptions: {
    parser: 'babel-eslint',
    sourceType: 'module'
  },
  env: {
    'browser': true,
    'node': true,
    'es6': true,
    'jquery': true
  },
  extends: [
    // https://github.com/feross/standard/blob/master/RULES.md#javascript-standard-style
    'standard',<% if ( projectusage === 'webpackApp' || projectjsframework === 'vue' ) { %>
    'plugin:vue/base',<% } %>
    'plugin:import/errors',
    'plugin:import/warnings'
  ],
  // check if imports actually resolve
  settings: {
    'import/resolver': {
      'webpack': {
        'config': 'webpack/webpack.prod.babel.js'
      }
    }
  },<% if ( projectusage === 'webpackApp' || projectjsframework === 'vue' ) { %>
  plugins: [
    'html'
  ],<% } %>
  rules: {
    // don't require .vue extension when importing
    'import/extensions': ['error', 'always', {
      'js': 'never'<% if ( projectusage === 'webpackApp' || projectjsframework === 'vue' ) { %>,
      'vue': 'never'<% } %>
    }],
    'object-curly-spacing': 0
  }
}
