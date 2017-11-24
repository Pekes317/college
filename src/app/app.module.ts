import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';

import { AppComponent } from './app.component';
import { routing, routingProviders } from './app.routing';
import { ColHomeComponent } from './col-home/col-home.component';
import { ColNavComponent } from './col-nav/col-nav.component';
import { ColSoundComponent } from './col-sound/col-sound.component';
import { ColWebComponent } from './col-web/col-web.component';

@NgModule({
  declarations: [
    AppComponent,
    ColHomeComponent,
    ColNavComponent,
    ColSoundComponent,
    ColWebComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    routing
  ],
  providers: [
    routingProviders
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
