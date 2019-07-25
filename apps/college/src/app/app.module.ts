import { HttpClientModule } from '@angular/common/http';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { ColAminVidComponent } from './col-amin-vid/col-amin-vid.component';
import { ColHomeComponent } from './col-home/col-home.component';
import { ColNavComponent } from './col-nav/col-nav.component';
import { ColSoundComponent } from './col-sound/col-sound.component';
import { ColWebComponent } from './col-web/col-web.component';
import { ColPrintComponent } from './col-print/col-print.component';
import { ColAboutComponent } from './col-about/col-about.component';
import { ServiceWorkerModule } from '@angular/service-worker';
import { environment } from '../environments/environment';

@NgModule({
  declarations: [
    AppComponent,
    ColAminVidComponent,
    ColHomeComponent,
    ColNavComponent,
    ColSoundComponent,
    ColWebComponent,
    ColPrintComponent,
    ColAboutComponent,
  ],
  imports: [
    AppRoutingModule,
    BrowserModule.withServerTransition({ appId: 'serverApp' }),
    HttpClientModule,
    ServiceWorkerModule.register('ngsw-worker.js', { enabled: environment.production }),
  ],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
