// Import some prompt modules
const promptsModule = require('./prompts/module')

function prompts() {
    return [
        ...promptsModule,
    ]
}

module.exports = prompts
