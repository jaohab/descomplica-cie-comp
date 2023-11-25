import { Component, EventEmitter, Input, Output } from '@angular/core';

@Component({
  selector: 'app-item-detail',
  templateUrl: './item-detail.component.html',
  styleUrls: ['./item-detail.component.css']
})
export class ItemDetailComponent {
  
  /**
   * Decorar ou Decorator é uma forma de dizer ao Angular 
   * como uma classe deve ser tratada.
   * 
   * O decorador @Input() em um componente filho significa 
   * que a propriedade pode receber seu valor de seu 
   * componente pai.
   */

  @Input() data:Date | undefined;

  /**
   * O decorador @Output() em um componente filho 
   * permite que os dados fluam do filho para o pai.
   * 
   * O componente filho usa a propriedade @Output() 
   * para gerar um evento para notificar o pai sobre 
   * a mudança. Para gerar um evento, um @Output() deve 
   * ter o tipo EventEmitter, que é uma classe em 
   * @angular/core que você usa para emitir eventos 
   * personalizados.
   */

  @Output() newItemEvent = new EventEmitter<string>();

  /**
   * A função addNewItem() usa @Output(), newItemEvent, 
   * para gerar um evento com o valor que o usuário 
   * digita em <input>.
   */

  addNewItem(value: string) {
    this.newItemEvent.emit(value);
  }


}
