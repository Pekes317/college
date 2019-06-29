const shell = require('shelljs');

shell.cp('-f', 'package.json', 'dist');
// shell.cp('-f', 'dist/main.js', 'dist/index.js');
shell.cp('-Rf', 'dist/views', 'public/');
// shell.rm('dist/main.js');
