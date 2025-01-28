Funcionalidade: Home Page
 Como um usuário do sistema
 Eu quero acessar a rota principal e receber o status code 200
 Para verificar se a API está funcionando corretamente
 
 Contexto: 
   Dado que não há nenhum usuário cadastrado no sistema
   Quando eu acesso a página principal devo ver a pagina renderizada na tela
   E ver o botão de cadastrar novo usuário

 Cenário: Primeiro acesso da página principal
   Dado que estou na tela principal
   Então devo conseguir visualizar a pagina corretamente
   E ver o botão com o texto "Novo Usuário"
   E o status code da resposta deve ser 200
   E não deve existir dados na minha tabela
  
