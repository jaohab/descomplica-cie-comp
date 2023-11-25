import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AppCalendarEventsComponent } from './app-calendar-events.component';

describe('AppCalendarEventsComponent', () => {
  let component: AppCalendarEventsComponent;
  let fixture: ComponentFixture<AppCalendarEventsComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AppCalendarEventsComponent]
    });
    fixture = TestBed.createComponent(AppCalendarEventsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
