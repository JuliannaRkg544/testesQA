
Funcionalidade: Gestão de Usuários
 Como usuário do sistema
 Eu quero criar, listar, atualizar e excluir usuários
 Para administrar usuários no sistema

Background: 
  Dado que acessei a pagina inicial corretamente

 @createUser @positive
 Cenário: Criar um usuário com todos os campos preenchidos
   Quando preencho todos os dados
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

Cenário: Falhar ao criar um usuário sem nome
   Quando não preencho o nome
   E preeencho todos os outros campos
   E clico no botão de "salvar"
   Entao aparece uma mensagem de aviso "Please fill out this field"

 Cenário: Falhar ao criar um usuário sem email
   Quando não preencho o email
   E preeencho todos os outros campos
   E clico no botão de "salvar"
   Entao aparece uma mensagem de aviso "Please fill out this field"

 Cenário: Falhar ao criar um usuário sem telefone
   Quando não preencho o telefone
   E preeencho todos os outros campos
   E clico no botão de "salvar"
   Entao aparece uma mensagem de aviso "Please fill out this field"

 Cenário: Falhar ao criar um usuário sem empresa
   Quando não preencho a opção de empresa
   E preeencho todos os outros campos
   E clico no botão de "salvar"
   Entao aparece um popup de erro

 Cenário: Falhar ao criar um usuário com data no formato errado 
   Quando preencho a data com o formato inválido
   E preeencho todos os outros campos
   E clico no botão de "salvar"
   Entao aparece um popup de erro 

 Cenario: Falhar ao criar um email com formato qualquer
  Quando preeencho email com o texto "meu email"
   E clico no botão de "salvar"
   Entao aparece um popup de erro 

 @getAllUsers
 Cenário: Listar todos os usuários
   E existem usuários cadastrados no sistema
   Quando a pagina carrega completamente
   Então aparece uma lista de usuários na pagina
   E a API responde a request com o status code 200
   E o corpo da resposta deve conter uma lista de usuários


 @updateUser
Cenário: Atualizar os dados de um usuário
  Dado que visualizo um usuário com informações que precisam ser atualizadas
  Quando clico no botão de edição
  Então os dados do usuário devem aparecer com permissão para edição
  E após editar os dados, clico no botão de salvar
  Então recebo um popup de confirmação
  E visualizo na página principal que as alterações foram salvas



 @deleteUser
 Cenário: Deletar um usuário
   Dado que visualizo um botão de deletar 
   Quando clico no botão de deletar
   Entao devo receber um pop up de confirmação que o usuário foi deletado
   E visualizar na página principal que o usuário foi removido
