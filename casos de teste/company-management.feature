Funcionalidade: Gestão de Empresas
 Como administrador
 Eu quero criar, listar, atualizar e excluir empresas
 Para gerenciar empresas no sistema


 @getAllCompanies
 Cenário: Listar todas as empresas
   Dado que a API está em execução
   Quando eu envio uma requisição GET para "/api/company"
   Então o status da resposta deve ser 200
   E o corpo da resposta deve conter uma lista de empresas


 @getCompanyById @positive
 Cenário: Buscar uma empresa por ID
   Dado que a API está em execução
   E existe uma empresa com ID "1"
   Quando eu envio uma requisição GET para "/api/company/1"
   Então o status da resposta deve ser 200
   E o corpo da resposta deve conter os dados da empresa


 @createCompany @positive
   Cenário: Criar uma empresa com sucesso
   Dado que a API está em execução
   Quando eu envio uma requisição POST para "/api/company/create" com o corpo:
     """
     {
         "name": "Empresa A",
         "cnpj": "00.000.000/0001-00",
         "adress": {
             "cep": "12345-678",
             "country": "Brasil",
             "city": "São Paulo",
             "street_location": "Rua das Flores",
             "number": "123",
             "district": "Centro"
         }
     }
     """
   Então o status da resposta deve ser 201
   E o corpo da resposta deve conter os dados da empresa criada


 @deleteCompany @positive
 Cenário: Deletar uma empresa
   Dado que a API está em execução
   E existe uma empresa com ID "1"
   Quando eu envio uma requisição DELETE para "/api/company/1/delete"
   Então o status da resposta deve ser 200
   E o corpo da resposta deve confirmar a exclusão


 
