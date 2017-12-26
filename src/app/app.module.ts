import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { AppComponent } from './app.component';
import { routing, routingProviders } from './app.routing';
import { ColAminVidComponent } from './col-amin-vid/col-amin-vid.component';
import { ColHomeComponent } from './col-home/col-home.component';
import { ColNavComponent } from './col-nav/col-nav.component';
import { ColSoundComponent } from './col-sound/col-sound.component';
import { ColWebComponent } from './col-web/col-web.component';
import { ColPrintComponent } from './col-print/col-print.component';
import { ColAboutComponent } from './col-about/col-about.component';
import { ColSwfService } from './shared/col-swf.service';

@NgModule({
  declarations: [
    AppComponent,
    ColAminVidComponent,
    ColHomeComponent,
    ColNavComponent,
    ColSoundComponent,
    ColWebComponent,
    ColPrintComponent,
    ColAboutComponent
  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'college' }),
    FormsModule,
    routing
  ],
  providers: [
    ColSwfService,
    routingProviders
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
