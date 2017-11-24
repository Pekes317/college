import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { ColHomeComponent } from './col-home/col-home.component';
import { ColSoundComponent } from './col-sound/col-sound.component';
import { ColWebComponent } from './col-web/col-web.component';

const routes: Routes = [
  { path: '', component: ColHomeComponent },
  { path: 'about', component: ColHomeComponent },
  { path: 'web', component: ColWebComponent },
  { path: 'images', component: ColHomeComponent },
  { path: 'animation', component: ColHomeComponent },
  { path: 'sounds', component: ColSoundComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
  providers: []
})

export class AppRoutingModule { }
