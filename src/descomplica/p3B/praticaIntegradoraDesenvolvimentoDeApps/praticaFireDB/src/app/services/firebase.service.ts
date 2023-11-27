import { Injectable } from '@angular/core';
import { AngularFireDatabase } from '@angular/fire/compat/database';

@Injectable({
  providedIn: 'root',
})
export class FirebaseService {
  constructor(private afDB: AngularFireDatabase) {}

  getProdutos() {
    return this.afDB.list('produtos').valueChanges();
  }

  adicionarProduto(produto: any) {
    return this.afDB.list('produtos').push(produto);
  }
}
