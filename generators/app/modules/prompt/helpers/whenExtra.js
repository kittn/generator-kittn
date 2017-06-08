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

const whenExtra = (key, answer, spawny) => {
    // Return actual when function provided by inquirer
  return (promptAnswers) => {
    console.log(spawny)
    return promptAnswers[key] === answer && spawny === true
  }
}

module.exports = whenExtra
