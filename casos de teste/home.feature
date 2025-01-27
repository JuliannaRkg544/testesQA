Funcionalidade: API Home
 Como um usuário do sistema
 Eu quero acessar a rota principal e receber uma mensagem de confirmação
 Para verificar se a API está funcionando corretamente

 Cenário: Acessar a rota home
   Dado que a API está em execução
   Quando eu envio uma requisição GET para "/"
   Então o status da resposta deve ser 200
   E o corpo da resposta deve ser:
     "
     {"msg": "home"}
     "
