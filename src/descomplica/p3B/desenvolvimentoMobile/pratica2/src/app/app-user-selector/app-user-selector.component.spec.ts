import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AppUserSelectorComponent } from './app-user-selector.component';

describe('AppUserSelectorComponent', () => {
  let component: AppUserSelectorComponent;
  let fixture: ComponentFixture<AppUserSelectorComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AppUserSelectorComponent]
    });
    fixture = TestBed.createComponent(AppUserSelectorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
