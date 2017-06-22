// http://eslint.org/docs/user-guide/configuring

module.exports = {
  root: true,
  parser: 'babel-eslint',
  parserOptions: {
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
    'standard',<% if ( projectjsframework === 'vue' ) { %>
    'vue',<% } %>
    'plugin:import/errors',
    'plugin:import/warnings'
  ],
  // check if imports actually resolve
  settings: {
    'import/resolver': {
      'webpack': {
        'config': 'webpack.config.babel.js'
      }
    }
  },<% if ( projectjsframework === 'vue' ) { %>
  plugins: [
    'html'
  ],<% } %>
  rules: {
    // don't require .vue extension when importing
    'import/extensions': ['error', 'always', {
      'js': 'never'<% if ( projectjsframework === 'vue' ) { %>,
      'vue': 'never'<% } %>
    }]
  }
}
