const starterpackCraft = (context) => {
  return {
    files: [
      {
        conditions: {
          projectcraftbp: true
        },
        src: 'src/skeletons/starterpack/craftcms/contentbuilder.json',
        dest: 'contentbuilder.json'
      }
    ],
    folders: [
      {
        conditions: {
          projectcraftbp: true
        },
        src: 'src/skeletons/starterpack/craftcms/structure/config/',
        dest: 'src/structure/config/'
      },
      {
        conditions: {
          projectcraftbp: true
        },
        src: 'src/skeletons/starterpack/craftcms/structure/templates/',
        dest: 'src/structure/templates/'
      },
      {
        conditions: {
          projectcraftbp: true
        },
        src: 'src/skeletons/starterpack/craftcms/structure/craftplugins/',
        dest: 'src/craftplugins/'
      },
      {
        conditions: {
          projectcraftbp: true
        },
        src: 'src/skeletons/starterpack/general/js/',
        dest: 'src/js/partial/'
      },
      {
        conditions: {
          projectcraftbp: true
        },
        src: 'src/skeletons/starterpack/general/style/',
        dest: 'src/style/'
      }
    ]
  }
}

module.exports = starterpackCraft
