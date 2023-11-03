import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PessoaPageComponent } from './pessoa-page.component';

describe('PessoaPageComponent', () => {
  let component: PessoaPageComponent;
  let fixture: ComponentFixture<PessoaPageComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [PessoaPageComponent]
    });
    fixture = TestBed.createComponent(PessoaPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
