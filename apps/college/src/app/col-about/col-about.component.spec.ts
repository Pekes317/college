import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ColAboutComponent } from './col-about.component';

describe('ColAboutComponent', () => {
  let component: ColAboutComponent;
  let fixture: ComponentFixture<ColAboutComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ColAboutComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ColAboutComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
