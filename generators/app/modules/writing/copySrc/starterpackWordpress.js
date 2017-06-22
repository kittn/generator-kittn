const starterpackWordpress = (context) => {
  return {
    files: [
      {
        conditions: {
          projectwordpressbp: true
        },
        src: 'src/skeletons/starterpack/wordpress/contentbuilder.json',
        dest: 'acf-contentbuilder.json'
      },
      {
        conditions: {
          projectwordpressbp: true
        },
        src: 'src/skeletons/starterpack/wordpress/adminimize-settings.json',
        dest: 'adminimize-settings.json'
      }
    ],
    folders: [
      {
        conditions: {
          projectwordpressbp: true
        },
        src: 'src/skeletons/starterpack/wordpress/structure/templates',
        dest: 'src/structure/templates/'
      },
      {
        conditions: {
          projectwordpressbp: true
        },
        src: 'src/skeletons/starterpack/wordpress/structure/plugins',
        dest: 'src/structure/plugins/',
        simplecopy: true
      },
      {
        conditions: {
          projectwordpressbp: true
        },
        src: 'src/skeletons/starterpack/general/js/',
        dest: 'src/js/partial/'
      },
      {
        conditions: {
          projectwordpressbp: true
        },
        src: 'src/skeletons/starterpack/general/style/',
        dest: 'src/style/'
      }
    ]
  }
}

module.exports = starterpackWordpress
