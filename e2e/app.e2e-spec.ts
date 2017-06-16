import { CollegePage } from './app.po';

describe('college App', () => {
  let page: CollegePage;

  beforeEach(() => {
    page = new CollegePage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
