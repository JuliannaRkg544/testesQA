const homepage = 'http://localhost:5400/'

describe('Home page', () => {
  it('should return 200 and display the page correctly', () => {
    cy.visit(homepage)
    .get('body').should('be.visible')
    .get('tbody').should('be.empty')
    cy.request(homepage)
      .should((response) => {
        expect(response.status).to.be.eq(200);
      })
})
  it ('should have a button to add a new user', ()=>{
    cy.visit(homepage);
    cy.get('button').contains('Novo Usuário').should('be.visible'); //
  })
})