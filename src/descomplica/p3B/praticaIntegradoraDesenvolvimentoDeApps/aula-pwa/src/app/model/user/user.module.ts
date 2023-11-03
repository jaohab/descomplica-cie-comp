import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';



@NgModule({
  declarations: [],
  imports: [
    CommonModule
  ]
})
export class User {
  public id: string = '';
  public firstName: string = '';
  public email: string = '';
  public phone: string = '';
  public cpf: string = '';
  public password: string = '';
  public dataNascimento: string = '';
}
