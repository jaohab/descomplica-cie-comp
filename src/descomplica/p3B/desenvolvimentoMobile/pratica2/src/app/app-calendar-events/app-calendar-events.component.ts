import { Component, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-calendar-events',
  templateUrl: './app-calendar-events.component.html',
  styleUrls: ['./app-calendar-events.component.css']
})
export class AppCalendarEventsComponent {
  @Input() startDate: Date;
  @Input() endDate: Date;
  @Output() onDateSelect: EventEmitter<Date> = new EventEmitter<Date>();

  constructor() {
    this.startDate = new Date();
    this.endDate = new Date();
  }

  selectDate(): void {
    const selectedDate = new Date();
    this.onDateSelect.emit(selectedDate);
  }
}
