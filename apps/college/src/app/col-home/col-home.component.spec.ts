import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ColHomeComponent } from './col-home.component';

describe('ColHomeComponent', () => {
  let component: ColHomeComponent;
  let fixture: ComponentFixture<ColHomeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ColHomeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ColHomeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should be created', () => {
    expect(component).toBeTruthy();
  });
});
