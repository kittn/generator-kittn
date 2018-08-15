module.exports = {
  verbose: true,
  collectCoverage: true,
  coverageReporters: ['json', 'html'],
  coverageDirectory: '<rootDir>/tests/unit/__coverage__',
  moduleFileExtensions: ['ts', 'tsx', 'js', 'jsx', 'json', 'vue'],
  collectCoverageFrom: [],
  testPathIgnorePatterns: [
    '/tests/e2e/'
  ],
  testURL: 'http://localhost/',
  snapshotSerializers: ['jest-serializer-vue'],
  testMatch: ['**/tests/unit/**/*.spec.(js|jsx|ts|tsx)|**/__tests__/*.(js|jsx|ts|tsx)'],
  roots: ['<rootDir>/tests/unit/'],
  transform: {
    '^.+\\.vue$': 'vue-jest',
    '.+\\.(css|styl|less|sass|scss|ttf|woff|woff2|svg)$': 'jest-transform-stub',
    '^[./a-zA-Z0-9$_-]+\\.(bmp|gif|jpg|jpeg|png|psd|webp)$':
      '<rootDir>/tests/unit/__transform__/mediaFileTransformer.js',
    '^.+\\.tsx?$': 'ts-jest',
    '^.+\\.js$': 'babel-jest'
  }
}
