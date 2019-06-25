const join = require('path').join;

const server = require(join(process.cwd(), 'dist', 'server', 'main.js'));
console.log(server);
