import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { AdicionarProdutoPageRoutingModule } from './adicionar-produto-routing.module';

import { AdicionarProdutoPage } from './adicionar-produto.page';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    AdicionarProdutoPageRoutingModule
  ],
  declarations: [AdicionarProdutoPage]
})
export class AdicionarProdutoPageModule {}
