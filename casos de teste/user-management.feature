
Funcionalidade: Gestão de Usuários
 Como usuário do sistema
 Eu quero criar, listar, atualizar e excluir usuários
 Para administrar usuários no sistema

Background: 
  Dado que acessei a pagina inicial corretamente

 @createUser @positive
 Cenário: Criar um usuário com todos os campos preenchidos
   Quando preencho todos os dados corretamente
   E clico no botão de "salvar"
   Entao um usuário é criado com sucesso 
   E seus dados são renderizados na tela principal
   E a resposta da API deve retornar o status 201

 Cenário: Criar um usuário com apenas os campos obrigatórios preenchidos
   Quando preencho todos os dados obrigatórios corretamente
   E clico no botão de "salvar"
   Entao um usuário é criado com sucesso 
   E seus dados são renderizados na tela principal
   E a resposta da API deve retornar o status 201


 @createUser @negative

Cenário: Criar um usuário sem nome
   Quando não preencho o nome
   E clico no botão de "salvar"
   Entao aparece uma mensagem de aviso "Please fill out this field"

 Cenário: Criar um usuário sem email
   Quando não preencho o email
   E clico no botão de "salvar"
   Entao aparece uma mensagem de aviso "Please fill out this field"


 @getAllUsers
 Cenário: Listar todos os usuários
   E existem usuários cadastrados no sistema
   Então o status da resposta deve ser 200
   E o corpo da resposta deve conter uma lista de usuários


 @updateUser
Cenário: Atualizar os dados de um usuário
  Dado que visualizo um usuário com informações que precisam ser atualizadas
  Quando clico no botão de edição
  Então os dados do usuário devem aparecer com permissão para edição
  E após editar os dados, clico no botão de salvar
  Então recebo um pop-up de confirmação
  E visualizo na página principal que as alterações foram salvas



 @deleteUser
 Cenário: Deletar um usuário
   Quando acesso a pagina principal
   E visualizo um usuário que quero deletar
   E visualizo o botão de deletar
   Quando clico no botão de deletar
   Entao devo receber um pop up de confirmação que o usuário foi deletado
   E visualizo na página principal que o usuário foi removido
