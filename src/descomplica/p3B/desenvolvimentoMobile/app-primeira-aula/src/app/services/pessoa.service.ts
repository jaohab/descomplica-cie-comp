import { Injectable } from "@angular/core";
import { Pessoa } from "../model/pessoa";
import { Observable } from "rxjs";
import { HttpClient } from "@angular/common/http";

const URL = "assets/data/pessoas.json"

@Injectable({providedIn: 'root'})
export class PessoaService {
    
    constructor(private http: HttpClient) {

    }
    
    salvar(pessoa: Pessoa) {
        console.log('salvando...')
        console.log(pessoa)
    }

    listar(): Observable<Pessoa[]> {
        return this.http.get<Pessoa[]>(URL)
    }
}