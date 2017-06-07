const styles = (context) => {
  return {
    files: [
      {
        conditions: {
          projectastrum: true
        },
        src: 'astrum-config.json',
        dest: 'astrum-config.json'
      }
    ],
    folders: [
    ]
  }
}

module.exports = styles
