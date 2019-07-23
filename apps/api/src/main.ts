import { Logger } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { ExpressAdapter } from '@nestjs/platform-express';
import { runWith } from 'firebase-functions';

import { AppModule } from './app/app.module';
import { environment } from './environments/environment';

const express = new ExpressAdapter();

const bootstrap = async () => {
  const app = await NestFactory.create(AppModule, express);
  const globalPrefix = 'api';
  app.setGlobalPrefix(globalPrefix);
  if (environment.production) {
    Logger.log('Running on Firebase');
    app.init();
  } else {
    const port = process.env.port || 3333;
    await app.listen(port, () => {
      Logger.log('Listening at http://localhost:' + port + '/' + globalPrefix);
    });
  }
};

bootstrap();
export const server = runWith({
  memory: '512MB',
  timeoutSeconds: 100
}).https.onRequest(express.getInstance());
