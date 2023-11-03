import { Component } from "@angular/core";

@Component({
    selector: 'app-pai',
    template: `
        <h2>No componente pai</h2>
        <a [routerLink]="['filho1']">Ir para componente Filho 1</a><br />
        <a [routerLink]="['filho2']">Ir para componente Filho 2</a>
        <router-outlet></router-outlet>
    `
})
export class PaiComponent {

}