import { Injectable } from "@angular/core";

@Injectable({providedIn: 'root'})
export class ClientService {
    
    constructor() {

    }
    
    sayHello() {
        return "Olá"
    }
}