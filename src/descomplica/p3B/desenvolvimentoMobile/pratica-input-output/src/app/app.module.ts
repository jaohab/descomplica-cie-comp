import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { MatDatepickerModule } from '@angular/material/datepicker';
import { ListaComponent } from './components/lista/lista.component';
import { FuncaoComponent } from './components/funcao/funcao.component';
import { Tela1Component } from './pages/tela-1/tela-1.component';
import { Tela2Component } from './pages/tela-2/tela-2.component';
import { ItemDetailComponent } from './components/item-detail/item-detail.component';
import { ItemDisplayComponent } from './components/item-display/item-display.component';



@NgModule({
    declarations: [
        AppComponent,
        ListaComponent,
        FuncaoComponent,
        Tela1Component,
        Tela2Component,
        ItemDetailComponent,
        ItemDisplayComponent,
    ],
    providers: [],
    bootstrap: [AppComponent],
    imports: [
        BrowserModule,
        AppRoutingModule,
        BrowserAnimationsModule,
        MatDatepickerModule,
    ]
})
export class AppModule { }
