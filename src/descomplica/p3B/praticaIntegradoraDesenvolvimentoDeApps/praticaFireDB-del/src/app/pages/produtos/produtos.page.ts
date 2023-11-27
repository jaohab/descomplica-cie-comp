import { Component } from '@angular/core';
import { FirebaseService } from '../../services/firebase.service';

@Component({
  selector: 'app-produtos',
  templateUrl: './produtos.page.html',
  styleUrls: ['./produtos.page.scss'],
})
export class ProdutosPage {
  produtos: any[] | undefined;

  constructor(private firebaseService: FirebaseService) {}

  ionViewDidEnter() {
    this.carregarProdutos();
  }

  carregarProdutos() {
    this.firebaseService.getProdutos().subscribe((data: any) => {
      this.produtos = data;
    });
  }
}
