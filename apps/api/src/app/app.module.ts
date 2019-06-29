import { Module } from '@nestjs/common';
import { loadPackage } from '@nestjs/common/utils/load-package.util';
import { AngularUniversalModule } from '@nestjs/ng-universal';
import { join } from 'path';

import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ssrPath } from '../util/env';

@Module({
  imports: [
    AngularUniversalModule.forRoot({
      bundle: loadPackage(join(ssrPath, 'server', 'main.js'), 'SSR'),
      viewsPath: join(ssrPath, 'views')
    })
  ],
  controllers: [AppController],
  providers: [AppService]
})
export class AppModule {}
