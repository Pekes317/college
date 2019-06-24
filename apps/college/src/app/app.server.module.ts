import { HTTP_INTERCEPTORS } from '@angular/common/http';
import { NgModule } from '@angular/core';
import {
  ServerModule,
  ServerTransferStateModule
} from '@angular/platform-server';
import { ModuleMapLoaderModule } from '@nguniversal/module-map-ngfactory-loader';

import { AppModule } from './app.module';
import { AppComponent } from './app.component';
import { UniversalInterceptorService } from './shared/interceptors/universal-interceptor.service';

@NgModule({
  imports: [
    AppModule,
    ModuleMapLoaderModule,
    ServerModule,
    ServerTransferStateModule
  ],
  providers: [
    {
      provide: HTTP_INTERCEPTORS,
      useClass: UniversalInterceptorService,
      multi: true // <-- important (you can have many interceptors)
    }
  ],
  bootstrap: [AppComponent]
})
export class AppServerModule {}
