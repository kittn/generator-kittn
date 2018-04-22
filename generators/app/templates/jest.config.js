module.exports = {
  verbose: true,
  collectCoverageFrom: [],
  testPathIgnorePatterns: [
    '/tests/e2e/'
  ],
  transform: {
    '^.+\\.js$': 'babel-7-jest',
    '.*\\.(vue)$': 'jest-vue-preprocessor'
  }
}
