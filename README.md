# README
## O que o app faz?
Esse aplicativo consiste em uma API que valida se uma senha é válida de acordo com as seguintes regras:

- Nove ou mais caracteres;
- Ao menos 1 dígito;
- Ao menos 1 letra minúscula;
- Ao menos 1 letra maiúscula;
- Ao menos 1 caractere especial;
  - Considere como especial os seguintes caracteres: !@#$%^&*()-+;
- Não possuir caracteres repetidos dentro do conjunto;

O endpoint para isso, tanto localmente quanto na web é:
`/api/v1/validate_password`
O método de requisição é `POST`

Retorno esperado:
`{
    "valid": false/true
}`

## Como utilizar a API via web?
A aplicação está hospedada no Google Cloud, através do APP Engine. Dessa forma, é possivel testar em produção utilizando a seguinte URL, através de uma requisição **POST**:
```

host: https://reflected-radio-425418-a0.rj.r.appspot.com

endpoint: /api/v1/validate_password

body: {"password": "SUA_SENHA_AQUI"}
```

## Como executar o app localmente?

1. Instale o Ruby, versão 3.1.2 -> https://www.ruby-lang.org/en/documentation/installation/
2. Clone este repositório -> `gh repo clone JoaoFRSeixas/challenge-PasswordValidatorApp`;
3. Dentro do repositório, execute o seguinte comando:
  `bundle install`
4. Após a finalização da instalação das gems e dependencias, execute o seguinte comando:
  `bundle exec rails server`

Pronto! Se tudo deu certo, o app já está rodando em seu ambiente local!
Agora você pode realizar o **POST** localmente, com essas informações:
```
curl --location 'http://127.0.0.1:3000/api/v1/validate_password' \
--data '{  "password":   "SUA_SENHA_AQUI" }'
```

## Testes unitários:
Essa aplicação utiliza a gem Rspec para os testes unitários. Para rodar todos de uma vez, dentro do diretório, execute o seguinte comando:

  `rspec`

Para testar apenas o fluxo de validação da senha, execute o comando:

`rspec spec/requests/password_validations_request_spec.rb`

## Decisões importantes:
### - Por que usar Ruby?
    Além de ter sido minha stack principal por bastante tempo, a sintaxe é bem parecida com JS, e o framework de Rails facilita a criação de controllers para uma API robusta e simples de ser entendida.

### - Por que utilizar a gem RSpec para testes, ao inves do padrão de Ruby?
    A sintaxe dos testes no RSpec é bem parecida com Jest, utilizar essa sintaxe facilita a compreensão ao realizar o teste antes de criar o serviço, endpoint e classe, O TDD!

### - Como a validação da senha funciona?
    Através de um service que recebe uma string e realiza validações utilizando expressões regulares (REGEX) de acordo com as regras definidas.
  
### - Qual melhoria seria aplicável?
    Utilizar um model "Senha" que valida a string usando métodos nativos de Ruby e então armazená-la criptografada, além de retornar dentro do objeto de resposta qual/quais condições não estão sendo atendidas, caso seja necessário.




## Specifications:

* Ruby version: 3.1.2

* Rails version: 7.1.3

* Database:
  Não inicializado.

* How to run the test suite:
  run RSpec

