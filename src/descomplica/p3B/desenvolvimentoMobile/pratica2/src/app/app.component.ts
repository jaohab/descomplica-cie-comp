import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'pratica2';

  initialDate: Date = new Date();
  finalDate: Date = new Date();
  selectedUsers: string[] = [];

  handleDateSelect(date: Date): void {
    console.log('Data selecionada:', date);
  }

  handleUserSelect(users: string[]): void {
    console.log('Usuários selecionados:', users);
  }
  
}
