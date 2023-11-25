import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FuncaoComponent } from './funcao.component';

describe('FuncaoComponent', () => {
  let component: FuncaoComponent;
  let fixture: ComponentFixture<FuncaoComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [FuncaoComponent]
    });
    fixture = TestBed.createComponent(FuncaoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
