import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ColAminVidComponent } from './col-amin-vid.component';

describe('ColAminVidComponent', () => {
  let component: ColAminVidComponent;
  let fixture: ComponentFixture<ColAminVidComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ColAminVidComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ColAminVidComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
