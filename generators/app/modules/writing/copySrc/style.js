const styles = (context) => {
  return {
    files: [
      {
        notConditions: {
          projectcssfilename: undefined
        },
        src: 'src/style/style.scss',
        dest: `src/style/${context.props.projectcssfilename}.scss`
      },
      {
        conditions: {
          projectcssfilename: undefined
        },
        src: 'src/style/style.scss',
        dest: `src/style/style.scss`
      },
      {
        src: 'src/style/_loader.scss',
        dest: 'src/style/_loader.scss'
      },
      {
        src: 'src/style/_setup.scss',
        dest: 'src/style/_setup.scss'
      },
      {
        src: 'postcss.config.js',
        dest: 'postcss.config.js'
      },
      {
        conditions: {
          projectnormalize: 'custom'
        },
        src: 'src/framework_additions/_normalize.scss',
        dest: 'src/framework/partials/_normalize.scss'
      },
      {
        orConditions: {
          projectnormalize: 'regular',
          projectusage: 'vueapp'
        },
        src: 'src/framework_additions/_normalize-slim.scss',
        dest: 'src/framework/partials/_normalize.scss'
      },
      {
        orConditions: {
          projectcssstructure: 'sassAtomic',
          projectusage: 'vueapp'
        },
        src: 'src/skeletons/style/_application_atomic.scss',
        dest: 'src/style/application/_application.scss'
      },
      {
        conditions: {
          projectcssstructure: 'sassITCSS'
        },
        src: 'src/skeletons/style/_application_itcss.scss',
        dest: 'src/style/application/_application.scss'
      },
      {
        conditions: {
          projectcssstructure: 'sassOwn'
        },
        src: 'src/skeletons/style/_application_own.scss',
        dest: 'src/style/application/_application.scss'
      },
      {
        conditions: {
          projectcritical: true
        },
        src: 'gulpfile_additions/optimize-criticalCss.js',
        dest: 'gulpfile/tasks/optimize-criticalCss.js'
      },
      {
        orConditions: {
          projectstylelint: true,
          projectusage: 'vueapp'
        },
        src: '_stylelintrc',
        dest: '.stylelintrc'
      },
      {
        src: '_sass-lint.yml',
        dest: '.sass-lint.yml'
      }
    ],
    folders: [
      {
        conditions: {
          projectcritical: true
        },
        src: 'nodescripts/',
        dest: 'nodescripts/'
      },
      {
        src: 'src/framework',
        dest: 'src/framework/'
      },
      {
        src: 'src/style/maps',
        dest: 'src/style/maps/'
      },
      {
        src: 'src/style/vendor',
        dest: 'src/style/vendor/'
      },
      {
        orConditions: {
          projectcssstructure: 'sassAtomic',
          projectusage: 'vueapp'
        },
        src: 'src/skeletons/style/atomic',
        dest: 'src/style/application/'
      },
      {
        conditions: {
          projectcssstructure: 'sassITCSS'
        },
        src: 'src/skeletons/style/itcss',
        dest: 'src/style/application/'
      }
    ]
  }
}

module.exports = styles
