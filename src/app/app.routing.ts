import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { ColAboutComponent } from './col-about/col-about.component';
import { ColAminVidComponent } from './col-amin-vid/col-amin-vid.component';
import { ColHomeComponent } from './col-home/col-home.component';
import { ColPrintComponent } from './col-print/col-print.component';
import { ColSoundComponent } from './col-sound/col-sound.component';
import { ColWebComponent } from './col-web/col-web.component';

const routes: Routes = [
  { path: '', component: ColHomeComponent },
  { path: 'about', component: ColAboutComponent },
  { path: 'web', component: ColWebComponent },
  { path: 'images', component: ColPrintComponent },
  { path: 'animation', component: ColAminVidComponent },
  { path: 'sounds', component: ColSoundComponent }
];

export const routingProviders: any[] = [

];

export const routing: ModuleWithProviders = RouterModule.forRoot(routes);