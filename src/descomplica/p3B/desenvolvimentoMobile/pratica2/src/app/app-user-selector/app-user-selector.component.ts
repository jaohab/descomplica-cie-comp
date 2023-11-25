import { Component, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-user-selector',
  templateUrl: './app-user-selector.component.html',
  styleUrls: ['./app-user-selector.component.css']
})
export class AppUserSelectorComponent {
  @Input() selectedUsers: string[];
  @Output() onUserSelect: EventEmitter<string[]> = new EventEmitter<string[]>();

  constructor() {
    this.selectedUsers = [];
  }

  selectUser(): void {
    const selectedUser = 'Usuário C';
    this.onUserSelect.emit([...this.selectedUsers, selectedUser]);
  }
}
