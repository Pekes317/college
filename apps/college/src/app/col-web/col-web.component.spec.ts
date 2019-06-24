import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ColWebComponent } from './col-web.component';

describe('ColWebComponent', () => {
  let component: ColWebComponent;
  let fixture: ComponentFixture<ColWebComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ColWebComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ColWebComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should be created', () => {
    expect(component).toBeTruthy();
  });
});
