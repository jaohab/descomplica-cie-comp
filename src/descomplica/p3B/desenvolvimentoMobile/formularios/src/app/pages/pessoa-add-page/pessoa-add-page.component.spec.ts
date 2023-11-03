import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PessoaAddPageComponent } from './pessoa-add-page.component';

describe('PessoaAddPageComponent', () => {
  let component: PessoaAddPageComponent;
  let fixture: ComponentFixture<PessoaAddPageComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [PessoaAddPageComponent]
    });
    fixture = TestBed.createComponent(PessoaAddPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
