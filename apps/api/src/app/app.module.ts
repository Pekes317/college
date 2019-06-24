import { Module } from '@nestjs/common';
import { loadPackage } from '@nestjs/common/utils/load-package.util';
import { AngularUniversalModule } from '@nestjs/ng-universal';
import { join } from 'path';

import { AppController } from './app.controller';
import { AppService } from './app.service';

const path = join(process.cwd(), 'dist');

@Module({
  imports: [
    AngularUniversalModule.forRoot({
      bundle: loadPackage(join(path, 'server', 'main.js'), 'SSR'),
      viewsPath: join(path, 'views')
    })
  ],
  controllers: [AppController],
  providers: [AppService]
})
export class AppModule {}
