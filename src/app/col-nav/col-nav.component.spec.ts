import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ColNavComponent } from './col-nav.component';

describe('ColNavComponent', () => {
  let component: ColNavComponent;
  let fixture: ComponentFixture<ColNavComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ColNavComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ColNavComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should be created', () => {
    expect(component).toBeTruthy();
  });
});
