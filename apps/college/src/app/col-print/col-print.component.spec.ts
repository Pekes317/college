import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ColPrintComponent } from './col-print.component';

describe('ColPrintComponent', () => {
  let component: ColPrintComponent;
  let fixture: ComponentFixture<ColPrintComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ColPrintComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ColPrintComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
