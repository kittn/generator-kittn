module.exports = {
  files: [
    {
      src: 'src/style/style.scss',
      dest: 'src/style/%s.scss',
      filename: 'projectcssfilename'
    },
    {
      src: 'src/style/_loader.scss',
      dest: 'src/style/_loader.scss'
    },
    {
      src: 'src/style/_setup.scss',
      dest: 'src/style/_loader.scss'
    },
    {
      projectContext: [
        'sassAtomic'
      ],
      src: 'src/skeletons/style/_application_atomic.scss',
      dest: 'src/style/_application/_application.scss'
    },
    {
      projectContext: [
        'sassITCSS'
      ],
      src: 'src/skeletons/style/_application_itcss.scss',
      dest: 'src/style/_application/_application.scss'
    },
    {
      projectContext: [
        'sassOwn'
      ],
      src: 'src/skeletons/style/_application_own.scss',
      dest: 'src/style/_application/_application.scss'
    }
  ],
  folders: [
    {
      projectContext: [
        'sassAtomic'
      ],
      src: 'src/skeletons/style/atomic',
      dest: 'src/style/_application/'
    },
    {
      projectContext: [
        'sassITCSS'
      ],
      src: 'src/skeletons/style/itcss',
      dest: 'src/style/_application/'
    }
  ]
}
