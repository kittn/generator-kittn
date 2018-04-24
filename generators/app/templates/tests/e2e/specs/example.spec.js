/*
* Example Test with Cypress Check if logo is there
*/

// https://docs.cypress.io/api/introduction/api.html

describe('Home', () => {
  beforeEach(() => {
    // Because we're only testing the homepage
    // in this test file, we can run this command
    // before each individual test instead of
    // repeating it in every test.
    cy.visit('http://localhost:3000');
  });

  it('Check if Sidebar is available', () => {
    // By using `data-qa` selectors, we can separate
    // CSS selectors used for styling from those used
    // exclusively for testing our application.
    // See: https://docs.cypress.io/guides/references/best-practices.html#Selecting-Elements
    cy.get('.c-pagelogo').should('be.visible');
  })
})
