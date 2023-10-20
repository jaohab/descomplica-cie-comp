import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'app-primeira-aula';
  descricao1 = 'Descrição 1';
  descricao2 = '';

  valor: {
    descricao: string,
    nome: string,
    id: number
  } = {
    descricao: 'DESC',
    nome: 'NOME',
    id: 1
  }

  clientePremium = false;

  nome = "";

  valores = [{
    id: 1,
    nome: 'NOME 1',
    descricao: 'DESC 1'
  },{
    id: 2,
    nome: 'NOME 2',
    descricao: 'DESC 2'
  },{
    id: 3,
    nome: 'NOME 3',
    descricao: 'DESC 3'
  }]

  adicionar() {
    this.valores.push({
      id: 4,
      nome: this.nome,
      descricao: 'adicionado'
    })
  }

}
