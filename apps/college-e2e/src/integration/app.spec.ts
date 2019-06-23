import { getGreeting } from '../support/app.po';

describe('college', () => {
  beforeEach(() => cy.visit('/'));

  it('should display welcome message', () => {
    getGreeting().contains('Welcome to college!');
  });
});
