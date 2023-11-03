import { Component } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Pessoa } from 'src/app/model/pessoa.model';
import { PessoaService } from 'src/app/services/pessoa.service';

@Component({
  selector: 'app-pessoa-add-page',
  templateUrl: './pessoa-add-page.component.html',
  styleUrls: ['./pessoa-add-page.component.css']
})
export class PessoaAddPageComponent {

  pessoa: any = {}

  hobies = [
    "Dançar",
    "Jogar",
    "Passear"
  ]

  formGroup = this.formBuilder.group({
    id: this.formBuilder.control<number|null>(null),
    nome: ['', Validators.required],
    email: ['', Validators.compose([Validators.required, Validators.email])],
    hobie: ['']
  })

  constructor(private formBuilder: FormBuilder, private service: PessoaService, private activeRoute: ActivatedRoute) {

  }

  ngOnInit(): void {
    const id = this.activeRoute.snapshot.paramMap.get('id')
    if (id) {
      this.formGroup.patchValue(this.service.buscar(id))
    }
  }

  salvar() {
    if (this.pessoa.nome === null || this.pessoa.nome === "") {
      alert("O campo nome é obrigatório.")
    } else {
      console.log('salvnado pessoa')
      console.log(this.pessoa)
    }
  }

  salvarReact() {
    if(this.formGroup.valid) {
      if(this.formGroup.value.id) {
        this.service.editar(this.formToValue(this.formGroup))
      } else {
        this.service.salvar(this.formToValue(this.formGroup))
        .subscribe(p => {
          alert('Pessoa salva com sucesso!')
        })
      }
    } else {
      alert("Campo inválido.")
    }
  }

  isError(control: 'nome' | 'email' | 'hobie', validor: string) {
    return this.formGroup.controls[control].getError(validor) ? true : false
  }

  formToValue(form: typeof this.formGroup): Pessoa {
    return {
      id: form.value.id!,
      nome: form.value.nome!,
      email: form.value.email!,
      hobie: form.value.hobie!
    }
  }
}
