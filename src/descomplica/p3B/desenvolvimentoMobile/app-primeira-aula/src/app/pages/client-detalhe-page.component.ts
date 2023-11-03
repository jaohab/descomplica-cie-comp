import { Component, OnInit } from "@angular/core";
import { ActivatedRoute } from "@angular/router";

@Component({
    selector: 'app-client-detalhe',
    template: `
        <h2>Detalhe do Cliente</h2>
        <p>ID: {{client.id}}</p>
        <p>{{client.nome}}</p>
        <p>{{client.descricao}}</p>
    `
})
export class ClienteDetalhamentoComponent implements OnInit{
    client = {id: "", nome: "", descricao: ""}

    constructor(private activeRouter: ActivatedRoute) {

    }
    ngOnInit(): void {
        const id = this.activeRouter.snapshot.paramMap.get("id");
        if (id) {
            this.client = {nome: "Cliente " + id, descricao: "Descrição do cliente " + id, id: id}
        }
    }
}