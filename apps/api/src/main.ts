import { Logger } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { createWindow } from 'domino';

import { AppModule } from './app/app.module';

const win = createWindow();

global['window'] = win;
global['document'] = win.document;

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  const globalPrefix = 'api';
  app.setGlobalPrefix(globalPrefix);
  const port = process.env.port || 3333;
  await app.listen(port, () => {
    Logger.log('Listening at http://localhost:' + port + '/' + globalPrefix);
  });
}

bootstrap();
