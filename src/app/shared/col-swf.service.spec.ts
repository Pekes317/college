import { TestBed, inject } from '@angular/core/testing';

import { ColSwfService } from './col-swf.service';

describe('ColSwfService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [ColSwfService]
    });
  });

  it('should be created', inject([ColSwfService], (service: ColSwfService) => {
    expect(service).toBeTruthy();
  }));
});
