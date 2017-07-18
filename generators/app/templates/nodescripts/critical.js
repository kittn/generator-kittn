const path = require('path')
const argv = require('yargs').argv
const critical = require('critical')
const chalk = require('chalk')
const kittn = require('../config.json')

doSynchronousLoop(kittn.cssabove.sites, processCriticalCss, () => {
  console.log('Done')
});

function processCriticalCss(element, i, callback) {
  const url = argv.url || kittn.cssabove.url
  const criticalSrc = `${url}${element.url}`
  const BASE_PATH = path.resolve(__dirname, '..')
  const criticalDest = `${`${BASE_PATH}/${kittn.src.templates}${element.template}`}_critical.min.css`
  console.log(`-> Generating critical CSS: ${chalk.cyan(criticalSrc)} -> ${chalk.magenta(criticalDest)}`)

  critical.generate(
    {
      src: criticalSrc,
      dest: criticalDest,
      inline: kittn.cssabove.inline,
      ignore: kittn.cssabove.ignore,
      include: kittn.cssabove.include,
      css: [
        kittn.dist.css + kittn.cssabove.cssfile
      ],
      minify: kittn.cssabove.minify,
      height: kittn.cssabove.height,
      width: kittn.cssabove.width
    },
    (err, output) => {
      callback();
    }
  );
}

// Process data in an array synchronously, moving onto the n+1 item only after the nth item callback
function doSynchronousLoop(data, processData, done) {
  if (data.length > 0) {
    const loop = (data, i, processData, done) => {
      processData(data[i], i, () => {
        if (++i < data.length) {
          loop(data, i, processData, done);
        } else {
          done();
        }
      });
    };
    loop(data, 0, processData, done);
  } else {
    done();
  }
}
