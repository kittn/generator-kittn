module.exports = {
  presets: [
    [
      '@babel/preset-env',
      {
        useBuiltIns: 'entry',
        // modules: false, // only use for element-ui
        debug: false
      }<% if ( locals.projectjsframework && projectjsframework === 'react' ) { %>, "@babel/preset-react"<% } %>
    ]
  ],
  plugins: [
    /**
     * Element UI Use
     */
    /*
    [
      'component',
      {
        libraryName: 'element-ui',
        styleLibraryName: 'theme-chalk'
      }
    ],
    */
    '@babel/plugin-syntax-dynamic-import',
    '@babel/plugin-proposal-class-properties',
    '@babel/plugin-proposal-object-rest-spread'
  ],
  env: {
    test: {
      presets: [['@babel/preset-env']]
    }
  }
}
