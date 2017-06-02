'use strict';

const generalPrompts = require('./prompt/_general');

function prompts() {
  return [...generalPrompts];
}

module.exports = prompts;
