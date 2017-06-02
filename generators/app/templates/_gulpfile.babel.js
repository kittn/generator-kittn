/**
 *  Kittn
 *  This gulpfile makes use of new JavaScript features.
 *  Babel handles this without us having to do anything. It just works.
 *  You can read more about the new JavaScript features here:
 *  https://babeljs.io/docs/learn-es2015/
 */

'use strict'

// Define Global Vars
global.checkChanged = true

require('babel-core/register')({
  presets: [
    ['es2015']
  ]
})

const requireDir = require('require-dir')

requireDir('./gulpfile/tasks', { recurse: true })
