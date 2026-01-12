# 🌟Book Store API com KarateDSL <img src="https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExa3Rja2l3dzV5ZHV6ZjV3czY5NW82OXNkc29wbjI3endmc2l1ZHU2aiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9cw/j5zI2It7Rg73L5HEdh/giphy.webp" width="50">
Foi desenvolvido um código em **Karate DSL** testando todas funcionalidades da **API Book Store API**, testando as funcionalidades exigidas e adicionais do desafio. O **Karate DSL** é uma ferramenta desenvolvida para facilitar os testes automatizados, e criado para ser prático, fácil e funcional de utilizar.
***
## 🚀 Tecnologias utilizadas

|      Tecnologia       |                                                                                             Utilização                                                                                              |
|:---------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
| <img src="https://skillicons.dev/icons?i=java" /> |                                          **Java**: Linguagem principal utilizada para o desenvolvimento da aplicação e execução dos testes automatizados.                                           |
| <img src="https://skillicons.dev/icons?i=maven" /> |                               **Maven**: Ferramenta de gerenciamento de dependências e build do projeto, responsável por organizar bibliotecas e executar os testes.                                |
| <img src="https://skillicons.dev/icons?i=git" /> |                            **Git**: Sistema de controle de versão utilizado para gerenciar o código-fonte, histórico de alterações e colaboração entre desenvolvedores.                             |
| <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Karate_software_logo.svg/256px-Karate_software_logo.svg.png?20180222200206" /> |                  <br/>**Karate DSL**: Framework de testes automatizados para APIs REST, que permite validar requisições, respostas e fluxos de negócio de forma simples e legível.                  |
***
### Instalação do projeto

1. **Clone o repositório e entre na pasta do projeto:**
   ```bash
   git clone https://github.com/EricM1303/Desafio3_Accenture.git
   cd Desafio3_Accenture
   ```
    1. **Entre na pasta do repositório clonado:**
   ```bash
    cd Desafio3_Accenture
   ```

2. **Ajuste de execução**:

- No diretório `features/KarateTest.java`, você pode usar a TAG @executar mencionada no mesmo para executar os testes
  por vez.
- Dentro dos arquivos de `features/`, seguindo o exemplo abaixo.

  1. Exemplo de ajuste:
    ```gherkin
    //"Onde estiver escrito:
    Scenario: Nome do cenário
  
    // Modifique para:
    @executar
    Scenario: Nome do cenário
    ```
  
3. **Executar testes automatizados:**
   ```bash
       mvn test
   ```
4. **Acessar reports de testes do Karate DSL:**
   ```text
   Através do terminal é disponibilizado um link 
   para acessar a página web e verificar os reports do karate DSL.
   // Como esse:
   <caminho-do-seu-arquivo>/target/karate-reports/karate-summary.html
   ```
***
## 📂 Estrutura de Pastas
* 📦 Desafio3_Accenture
    * 📂 .idea
        * 📂 src
            * 📂 test
                * 📂 java                        <!-- testes do java -->        
                    * 📂 features                
                        * 📂 account             <!-- features testes gherkin em account-->
                            * 📜 criar-usuario.feature
                            * 📜 deletar-usuario.feature
                            * 📜 gerar-token.feature
                        * 📂 bookstore           <!-- features testes gherkin em bookstore-->
                            * 📜 adicionar-livro.feature
                            * 📜 atualizar-livro.feature
                            * 📜 buscar-livro.feature
                            * 📜 token-extra.feature                   
                    * 📂 support.utils            <!-- classes de automação em java -->
                         * 📜 Utils       
                    * 📜 KarateTest               <!-- Arquivo runner que roda os testes -->
    * 📂 target                                   <!-- Relatório de testes maven/gherkin -->    
    * 📜 .gitignore
    * 📜 pom.xml
    * 📜 README.md 👉 Você está aqui! 😊

***
## 🟨 Pontos adicionais
Foi implementado automação por java para facilitar geração automática de senhas e nomes de usuário através da biblioteca **Faker**, além disso, foi criado um arquivo .feature a mais para gerar tokens separadamente da pasta **account** que é responsável pelas requisições do usuário.

***
#### ✒️ Autor do projeto <img width="20%" align="right" src="https://media.giphy.com/media/YRMb6dd7zprS00JdGZ/giphy.gif" alt="Carinha programandor"/>
* **Eric Matheus Nunes Campelo**➡️[**_Github/Eric_**](https://github.com/EricM1303)
***