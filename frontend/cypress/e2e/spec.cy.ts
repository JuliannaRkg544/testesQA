const homepage = 'http://localhost:5400/'

describe('Home page', () => {
  it('should return 200', () => {
    cy.visit(homepage)
    cy.request(homepage)
      .should((response) => {
        expect(response.status).to.eq(200);
      })
})
})
