module.exports = {
  name: 'college',
  preset: '../../jest.config.js',
  coverageDirectory: '../../coverage/apps/college',
  snapshotSerializers: [
    'jest-preset-angular/AngularSnapshotSerializer.js',
    'jest-preset-angular/HTMLCommentSerializer.js'
  ]
};
