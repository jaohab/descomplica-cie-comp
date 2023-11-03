import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PaiComponent } from './pages/pai/pai.component';
import { Filho1Component } from './pages/filho1/filho1.component';
import { Filho2Component } from './pages/filho2/filho2.component';

const routes: Routes = [
  { path: 'pai', component: PaiComponent, 
    children: [
      { path: 'filho1', component: Filho1Component},
      { path: 'filho2', component: Filho2Component}
    ]},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
