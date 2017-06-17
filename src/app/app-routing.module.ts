import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { ColHomeComponent } from './col-home/col-home.component';

const routes: Routes = [
  { path: '', component: ColHomeComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
  providers: []
})

export class AppRoutingModule { }
