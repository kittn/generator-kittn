// http://eslint.org/docs/user-guide/configuring

module.exports = {
  root: true,
  parserOptions: {
    parser: <% if (projecttypescript === true) { %>'typescript-eslint-parser'<% } else { %>'babel-eslint'<% } %>,
    ecmaVersion: 2017,
    sourceType: 'module'
  },
  env: {
    'browser': true,
    'node': true,
    'es6': true,
    'jquery': true<% if (projecttestingunit === true) { %>,
    'jest': true<% } %>
  },
  extends: [
    // https://github.com/feross/standard/blob/master/RULES.md#javascript-standard-style
    'standard',<% if ( projectusage === 'webpackApp' || projectjsframework === 'vue' ) { %>
    'plugin:vue/base',<% } %>
    'plugin:import/errors',
    'plugin:import/warnings'<% if ( projectprettier === true ) { %>,
    'plugin:prettier/recommended'<% } %>
  ],<% if (projecttypescript === true) { %>
  plugins: ['typescript'],<% } %>
  // check if imports actually resolve
  settings: {
    'import/resolver': {
      'webpack': {
        'config': 'webpack/webpack.prod.babel.js'
      }
    }
  },
  rules: {
    // don't require .vue extension when importing
    'import/extensions': ['error', 'always', {
      'js': 'never'<% if ( projectusage === 'webpackApp' || projectjsframework === 'vue' ) { %>,
      'vue': 'never'<% } %>
    }],
    'object-curly-spacing': 0,
    'space-before-function-paren': <% if ( projectprettier === true ) { %>0<% } else { %>1<% } %>
  }
}
