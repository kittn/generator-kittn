/*
 * When helper function to stop repeat myself
 * Wrapping When Function to pass the prompt Type
 * {
 *   when: when('craft'),
 * }
 *
 * @param type (String)
 * @returns {function(*)}
 */

const when = (key, answer) => {
    // Return actual when function provided by inquirer
  return (promptAnswers) => {
    console.log('foobar')
    return promptAnswers[key] === answer
  }
}

module.exports = when
