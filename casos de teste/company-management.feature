Funcionalidade: Gestão de Empresas
 Como usuário do sistema
 Eu quero criar, listar, atualizar e excluir empresas

Background: 
  Dado que a API está em execução

 @getAllCompanies
 Cenário: Listar todas as empresas

   Quando eu envio uma requisição GET para "/api/company"
   Então o status da resposta deve ser 200
   E o corpo da resposta deve conter uma lista de empresas


 @getCompanyById @positive
 Cenário: Buscar uma empresa por ID
   E existe uma empresa com ID "1"
   Quando eu envio uma requisição GET para "/api/company/1"
   Então o status da resposta deve ser 200
   E o corpo da resposta deve conter os dados da empresa

 @getCompanyById @negative
 Cenário: Buscar uma empresa por ID inválido
   Quando eu envio uma requisição GET para "/api/company/abc"
   Então o status da resposta deve ser 400


 @createCompany @positive
   Cenário: Criar uma empresa com sucesso
   Quando eu envio uma requisição POST para "/api/company/create" com o corpo:
     ""
     {
         "name": "Empresa1",
         "cnpj": "00.000.000/0001-00",
         "adress": {
             "cep": "2790-000",
             "country": "Brasil",
             "city": "Macaé",
             "street_location": "Rua Kleber Guimarães",
             "number": "55",
             "district": "Centro"
         }
     }
     ""
   Então o status da resposta deve ser 201
   E o corpo da resposta deve conter os dados da empresa criada

 @createCompany @negative
   Cenário: Falhar ao tentar criar uma empresa com um tipo de dado errado
   Quando eu envio uma requisição POST para "/api/company/create" com um body do tipo:
     ""
     {
         "name": 1,
         "cnpj": "00.000.000/0001-00",
         "adress": {
             "cep": "2790-000",
             "country": "Brasil",
             "city": "Macaé",
             "street_location": "Rua Kleber Guimarães",
             "number": "55",
             "district": "Centro"
         }
     }
     ""
   Então o status da resposta deve ser 400

@updateCompany @positive
Cenario: Atualizar os dados de uma empresa com dados válidos 
  E existe um empresa cadastrada com o id 1
  Quando envio uma requisição PATCH para "/api/company/1/update" com um body do tipo:
   ""
     {
         "name": "Empresa1",
         "cnpj": "00.000.000/0001-00",
         "adress": {
             "cep": "2790-000",
             "country": "Brasil",
             "city": "Rio de janeiro",
             "street_location": "Rua Kleber Guimarães",
             "number": "55",
             "district": "Centro"
         }
     }
     ""
     Entao devo receber o status code 200

@updateCompany @negative
Cenario: Falhar ao tentar atualizar os dados de uma empresa com ID inválido 
  Quando envio uma requisição PATCH para "/api/company/abc/update" com um body do tipo:
   ""
     {
         "name": "Empresa1",
         "cnpj": "00.000.000/0001-00",
         "adress": {
             "cep": "2790-000",
             "country": "Brasil",
             "city": "Rio de janeiro",
             "street_location": "Rua Kleber Guimarães",
             "number": "55",
             "district": "Centro"
         }
     }
     ""
     Entao devo receber o status code 400


 @deleteCompany @positive
 Cenário: Deletar uma empresa 
   E existe uma empresa com ID 1
   Quando eu envio uma requisição DELETE para "/api/company/1/delete"
   Então o status da resposta deve ser 200
   E o corpo da resposta deve confirmar a exclusão


  @deleteCompany @negative
 Cenário: Falhar ao deletar uma empresa com ID inválido
   E informa um ID inválido, como abc
   Quando eu envio uma requisição DELETE para "/api/company/abc/delete"
   Então o status da resposta deve ser 400


 
