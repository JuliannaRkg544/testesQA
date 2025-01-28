
const mainpage = 'http://localhost:5400/'
const bodyWithRequiredFields = { 
    name: 'Usuario teste1',
    email: 'teste@email2.com',
    companies: ['Empresa 1']}

    const bodyWithAllFields = { 
      name: 'Usuario teste2',
      email: 'teste@email2.com',
      companies: ['Empresa 1'],
      telephone: '2245678998',
      birth_city: 'Nova Friburgo',
      birth_date: '2000-12-09',
    }


describe('Create one user', () => {
  it('Should create a user with all fields', () => {
    cy.visit(mainpage)
    .get('#new-user').click()
    .get('input[placeholder="Nome"]').type(bodyWithAllFields.name)
    .get('input[placeholder="Email"]').type(bodyWithAllFields.email)
    .get('input[placeholder="Telefone"]').type(bodyWithAllFields.telephone)
    .get('input[placeholder="Cidade de nascimento"]').type(bodyWithAllFields.birth_city)
    .get('input[placeholder="Data de nascimento"]').type(bodyWithAllFields.birth_date)
    .get('input[placeholder="Empresas"]').type(bodyWithAllFields.companies[0]) 
    .get('.optionContainer')
    .find('li') 
    .contains(bodyWithAllFields.companies[0]) 
    .click()
    .get('button[type="submit"]').click({ force: true })
    .visit(mainpage)
    .get('tbody tr:last-child td:first-child').should('have.text',bodyWithAllFields.name)
    
  });
  it('Should create a user with just required fields', () => {
    cy.visit(mainpage)
    .get('#new-user').click()
    .get('input[placeholder="Nome"]').type(bodyWithRequiredFields.name)
    .get('input[placeholder="Email"]').type(bodyWithRequiredFields.email)
    .get('input[placeholder="Empresas"]').type(bodyWithRequiredFields.companies[0]) 
    .get('.optionContainer')
    .find('li') 
    .contains(bodyWithRequiredFields.companies[0]) 
    .click()
    .get('button[type="submit"]').click({ force: true })
    .visit(mainpage)
    .get('tbody tr:last-child td:first-child').should('have.text',bodyWithRequiredFields.name)
    
  });
  it ('should receive a warning message when creates a user with no name', ()=>{
    cy.visit(mainpage)
    .get('#new-user').click()
    .get('input[placeholder="Email"]').type(bodyWithRequiredFields.email)
    .get('input[placeholder="Empresas"]').type(bodyWithRequiredFields.companies[0]) 
    .get('.optionContainer')
    .find('li') 
    .contains(bodyWithRequiredFields.companies[0]) 
    .click()
    .get('button[type="submit"]').click({ force: true })
    .get('input[placeholder="Nome"]')
    .then(($input) => {
      expect($input[0].checkValidity()).to.be.false; 
      expect($input[0].validationMessage).to.contain('Please fill out this field');
  })
 
})
it ('should receive a warnig message when creates a user with no email', ()=>{
  cy.visit(mainpage)
  .get('#new-user').click()
  .get('input[placeholder="Nome"]').type(bodyWithRequiredFields.name)
  .get('input[placeholder="Empresas"]').type(bodyWithRequiredFields.companies[0]) 
  .get('.optionContainer')
  .find('li') 
  .contains(bodyWithRequiredFields.companies[0]) 
  .click()
  .get('button[type="submit"]').click({ force: true })
  .get('input[placeholder="Email"]')
  .then(($input) => {
    expect($input[0].checkValidity()).to.be.false; 
    expect($input[0].validationMessage).to.contain('Please fill out this field');
})

})
})