import { Component, ViewChild } from '@angular/core';
import { ListaComponent } from '../lista/lista.component';

@Component({
  selector: 'app-funcao',
  templateUrl: './funcao.component.html',
  styleUrls: ['./funcao.component.css']
})
export class FuncaoComponent {
  @ViewChild("lista")
  lista!: ListaComponent
  reset() {
    this.lista.reset()
  }

  start = 0;
  end = 10;

  selecionado: number | undefined

  incrementarStar() {
    this.start++;
  }
  decrementarStar() {
    this.start--;
  }
  incrementarEnd() {
    this.end++;
  }
  decrementarEnd() {
    this.end--;
  }
}

