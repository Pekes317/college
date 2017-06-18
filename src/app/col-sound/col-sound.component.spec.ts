import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ColSoundComponent } from './col-sound.component';

describe('ColSoundComponent', () => {
  let component: ColSoundComponent;
  let fixture: ComponentFixture<ColSoundComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ColSoundComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ColSoundComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should be created', () => {
    expect(component).toBeTruthy();
  });
});
