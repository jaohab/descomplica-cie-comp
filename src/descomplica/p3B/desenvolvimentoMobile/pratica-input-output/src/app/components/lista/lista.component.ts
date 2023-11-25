import { Component, EventEmitter, Input, OnChanges, OnInit, Output, SimpleChanges } from '@angular/core';

@Component({
  selector: 'app-lista',
  templateUrl: './lista.component.html',
  styleUrls: ['./lista.component.css']
})
export class ListaComponent implements OnInit, OnChanges {

  /**
   * Decorar ou Decorator é uma forma de dizer ao Angular 
   * como uma classe deve ser tratada.
   * 
   * O decorador @Input() em um componente filho significa 
   * que a propriedade pode receber seu valor de seu 
   * componente pai.
   */
  
  @Input() start = 0;
  @Input() end = 10;

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

  @Output() onSelected = new EventEmitter<number>();

  selectedNumber(n: number) {
    this.onSelected.next(n);
  }

  integers: number [] = [];

  ngOnInit(): void {
    this.makeIntegers();
  }

  /**
   * 
   * Observando alterações em @Input()
   * 
   * Para observar alterações em uma propriedade @Input(), 
   * usa-se o OnChanges. 
   * 
   * Um método de callback que é invocado imediatamente 
   * após o detector de alterações padrão ter verificado as 
   * propriedades vinculadas a dados, se pelo menos uma tiver sido 
   * alterada, e antes que os filhos da visualização e do conteúdo 
   * sejam verificados.
   * 
   * ??????????????
   */

  ngOnChanges(changes: SimpleChanges) {
    const start = changes['start']?.currentValue;
    const end = changes['end']?.currentValue;
    if (start) {
      this.start = start;
    }
    if (end) {
      this.end = end;
    }
    this.makeIntegers();
  }

  makeIntegers() {
    this.integers = []
    for (let i = this.start; i <= this.end; i++) {
      this.integers.push(i);
    }
  }

  reset() {
    this.start = 0;
    this.end = 10;
    this.makeIntegers();
  }

}
