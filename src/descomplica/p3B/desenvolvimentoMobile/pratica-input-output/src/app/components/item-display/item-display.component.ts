import { Component } from '@angular/core';

@Component({
  selector: 'app-item-display',
  templateUrl: './item-display.component.html',
  styleUrls: ['./item-display.component.css']
})
export class ItemDisplayComponent {
  dataAtual = new Date;

  /**
   * Array de itens exibidos no componente
   */
  
  items = ['item1', 'item2', 'item3'];

  /**
   * O método addItem() pega a string e então a adiciona 
   * essa string ao array de itens.
   */

  addItem(novoItem: string) {
    this.items.push(novoItem);
  }
}