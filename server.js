'use strict';

require('zone.js/dist/zone-node');

const domino = require('domino');
const fs = require('fs');
const path = require('path');
const template = fs.readFileSync(path.join(__dirname, 'dist', 'index.html')).toString();
const win = domino.createWindow(template);
global['window'] = win;
global['document'] = win.document;
global['navigator'] = win['navigator'];

const express = require('express');
const ngUniversal = require('@nguniversal/express-engine');
const appServer = require('./dist-server/main.bundle');
const port = process.env.PORT || '50100';

function angularRouter(req, res) {

  res.render('index', {
    req,
    res,
    providers: [{
      provide: 'serverUrl',
      useValue: `${req.protocol}://${req.get('host')}`
    }]
  });

}

const app = express();

app.get('/', angularRouter);

app.use(express.static(`${__dirname}/dist`));

app.get('/api', (req, res) => {
  res.json({ data: 'Content from HTTP request.' });
});

app.engine('html', ngUniversal.ngExpressEngine({
  bootstrap: appServer.AppServerModuleNgFactory
}));

app.set('view engine', 'html');
app.set('views', 'dist');

app.get('*', angularRouter);

app.listen(port, () => {
	console.log(`Listening on ${port}`);
});