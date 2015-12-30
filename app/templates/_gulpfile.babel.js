/**
 *  Kittn
 *  This gulpfile makes use of new JavaScript features.
 *  Babel handles this without us having to do anything. It just works.
 *  You can read more about the new JavaScript features here:
 *  https://babeljs.io/docs/learn-es2015/
 */

'use strict'

import requireDir from 'require-dir'

// Define Global Vars
global.changedOverride = false

// Require all tasks in gulpfile/tasks, including subfolders
requireDir('./gulpfile/tasks', {recurse: true} )
