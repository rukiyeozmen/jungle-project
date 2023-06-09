// cypress/integration/product_details.spec.js

describe('Product Details', () => {
  beforeEach(() => {
    // Visit the home page
    cy.visit('/');

    // Wait for the products to load
    cy.get('.products article').should('be.visible');
  });

  it('allows users to navigate to the product detail page', () => {
    // Click on the first product link
    cy.get('.products article')
      .first()
      .find('a')
      .click();

    // Verify that the user is on the product detail page
    cy.url().should('include', '/products/');
  });
});
