import { Component } from "@angular/core";

@Component({
    selector: 'app-binding',
    template: `
    <h1>Imagem do Angular</h1>
    <img [src]="imagem" [style]="{width: width, height: height}" />
    <div class="alert" [class]="{sucess: sucesso}" [style.background-color]="backgroundcolor">
        Alerta
    </div>
    <button (click)="enviarDados()">Enviar dados</button>
    `,
    styles: [
        `.alert {
            width: 200px;
            height: 100px;
            border: 1px solid blue;
        }
        .sucess {
            border: 3px solid green;
        }`
    ]
})
export class bindingPageComponent {

    imagem = "https://angular.io/assets/images/logos/angular/angular.svg"
    width = "150px"
    height = "200px"

    sucesso = true

    backgroundcolor = "green"

    enviarDados() {
        this.sucesso = !this.sucesso
        if (this.sucesso==true) {
            this.backgroundcolor = "green"
        } else {
            this.backgroundcolor = "blue"
        }
    }

}