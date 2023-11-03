import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ClientListPage } from './pages/client-list-page.component';
import { Filho1Component } from './pages/filho1-page.component';
import { Filho2Component } from './pages/filho2-page.component';
import { PaiComponent } from './pages/pai-page.component';
import { UserGuard } from './guards/user.guard';
import { LoginPage } from './pages/login-page.component';
import { ClienteDetalhamentoComponent } from './pages/client-detalhe-page.component';
import { RXJSPageComponent } from './pages/rxjs-page.component';
import { ListaPessoasPage } from './pages/lista-pessoas-page.component';
import { UserPageComponent } from './pages/user-page.component';

const routes: Routes = [
  {path: 'client', component: ClientListPage, canActivate: [UserGuard]},
  {path: 'login', component: LoginPage},
  {path: 'listaPessoa', component: ListaPessoasPage},
  {path: 'userPage', component: UserPageComponent},
  {path: 'rxjs', component: RXJSPageComponent},
  {path: 'pai', component: PaiComponent, 
    children: [
      {path: 'filho1', component: Filho1Component},
      {path: 'filho2', component: Filho2Component}
    ]},
  {path: 'client/detalhe/:id', component: ClienteDetalhamentoComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
