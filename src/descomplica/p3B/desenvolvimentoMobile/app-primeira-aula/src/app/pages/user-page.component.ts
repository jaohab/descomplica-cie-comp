import { Component, OnInit } from "@angular/core";
import { UserService } from "../services/user.service";
import { Observable } from "rxjs";
import { User } from "../model/user";

@Component({
    selector: 'app-user-page',
    templateUrl: './user-page.component.html'
})
export class UserPageComponent implements OnInit{

    users!: Observable<User[]>
    constructor(private service: UserService) {

    }
    ngOnInit() { 
        this.users = this.service.getUsers()
    }

    editar(user: User) {
        const editado = user
        editado.name = "New Name"
        this.service.putUser(user.id, editado)
    }

    deletar(user: User) {
        this.service.deleteUser(user.id)
    }

    novoUser() {
        const user: User = {
            id: 545555,
            name: "Novo Usuário",
            email: "email@email.com"
        }
        this.service.postUser(user)
    }
}