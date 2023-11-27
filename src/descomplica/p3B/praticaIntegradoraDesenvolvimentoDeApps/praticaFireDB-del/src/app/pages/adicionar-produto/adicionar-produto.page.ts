import { Component } from '@angular/core';
import { FirebaseService } from '../../services/firebase.service';

@Component({
  selector: 'app-adicionar-produto',
  templateUrl: './adicionar-produto.page.html',
  styleUrls: ['./adicionar-produto.page.scss'],
})
export class AdicionarProdutoPage {
  produto = {
    nome: '',
    descricao: '',
    preco: 0,
    quantidade: 0,
  };

  constructor(private firebaseService: FirebaseService) {}

  adicionarProduto() {
    this.firebaseService.adicionarProduto(this.produto).then(() => {
      console.log('Produto adicionado com sucesso!');
    });
  }
}
