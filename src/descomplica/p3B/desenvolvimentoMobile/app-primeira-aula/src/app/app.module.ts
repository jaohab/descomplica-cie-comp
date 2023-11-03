import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ComponentModule } from './components/components.module';
import { FormsModule } from '@angular/forms';
import { ClientListPage } from './pages/client-list-page.component';
import { bindingPageComponent } from './pages/binding-page.component';
import { CustomUpperCase } from './pipes/custom-uppercase.pipe';
import { ClientService } from './services/client.service';
import { Filho1Component } from './pages/filho1-page.component';
import { Filho2Component } from './pages/filho2-page.component';
import { PaiComponent } from './pages/pai-page.component';
import { LoginPage } from './pages/login-page.component';
import { ClienteDetalhamentoComponent } from './pages/client-detalhe-page.component';
import { RXJSPageComponent } from './pages/rxjs-page.component';
import { HttpClientModule } from '@angular/common/http';
import { ListaPessoasPage } from './pages/lista-pessoas-page.component';
import { UserPageComponent } from './pages/user-page.component';

@NgModule({
  declarations: [
    AppComponent,
    ClientListPage,
    ClienteDetalhamentoComponent,
    bindingPageComponent,
    CustomUpperCase,
    Filho1Component,
    Filho2Component,
    PaiComponent,
    LoginPage,
    RXJSPageComponent,
    ListaPessoasPage,
    UserPageComponent
  ],
  imports: [
    BrowserModule,
    ComponentModule,
    HttpClientModule,
    AppRoutingModule,
    FormsModule
  ],
  providers: [ClientService],
  bootstrap: [AppComponent]
})
export class AppModule { }
