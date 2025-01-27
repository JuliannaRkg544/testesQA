
Funcionalidade: Gestão de Usuários
 Como administrador
 Eu quero criar, listar, atualizar e excluir usuários
 Para gerenciar usuários no sistema

Contexto: 
 Dado que a API está em execução

 @getAllUsers
 Cenário: Listar todos os usuários
   Quando eu envio uma requisição GET para "/api/user"
   Então o status da resposta deve ser 200
   E o corpo da resposta deve conter uma lista de usuários


 @getUserById @positive
 Cenário: Buscar um usuário por ID
   E existe no mínimo 1(um) usuário
   Quando eu envio uma requisição GET para "/api/user/0"
   Então o status da resposta deve ser 200
   E o corpo da resposta deve conter os dados do usuário


 @getUserById @negative
 Cenário: Falha ao buscar um usuário com ID inválido
   Quando eu envio uma requisição GET para "/api/user/abc"
   Então o status da resposta deve ser 400
   E o corpo da resposta deve conter uma mensagem de erro

 @createUser @positive
 Cenário: Criar um usuário com sucesso
   Quando eu envio uma requisição POST para "/api/user/create" com o corpo:
     ""
     {
         "name": "João Silva",
         "e-mail": "joao@email.com",
         "companies": ["Empresa A"]
     }
     ""
   Então o status da resposta deve ser 201
   E o corpo da resposta deve conter os dados do usuário criado


 @createUser @negative
 Cenário: Falha ao criar um usuário com dados inválidos
   Quando eu envio uma requisição POST para "/api/user/create" com o corpo:
     ""
     {
         "name": "",
         "e-mail": "joao@email.com",
         "companies": []
     }
     ""
   Então o status da resposta deve ser 400
   E o corpo da resposta deve conter uma mensagem de erro


 @updateUser @positive
 Cenário: Atualizar os dados de um usuário
   E existe um usuário com ID "0"
   Quando eu envio uma requisição PATCH para "/api/user/0/update" com o corpo:
     ""
     {
         "name": "João Atualizado",
         "e-mail": "joao.novo@email.com",
         "companies": ["Empresa B"]
     }
     ""
   Então o status da resposta deve ser 200
   E o corpo da resposta deve conter os dados atualizados do usuário


 @deleteUser @positive
 Cenário: Deletar um usuário
   E existe um usuário com ID "0"
   Quando eu envio uma requisição DELETE para "/api/user/0/delete"
   Então o status da resposta deve ser 200
   E o corpo da resposta deve confirmar a exclusão