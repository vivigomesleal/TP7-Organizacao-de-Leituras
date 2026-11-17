
# TP7 – Minha Estante

## Aplicativo de Organização de Leituras

Projeto desenvolvido em Flutter e Dart para a atividade TP7, com o objetivo de organizar uma lista pessoal de livros e acompanhar o status de leitura.

**Integrante:** Vivian Gomes Leal da Rocha Santos

## Funcionalidades

- Listagem de livros utilizando `ListView`.
- Cadastro de título e autor com `TextField`.
- Seleção do status utilizando `DropdownButton`:
  - Quero ler
  - Lendo
  - Concluído
- Adição e remoção de livros.
- Navegação entre telas com `Navigator`.
- Atualização da interface com `StatefulWidget` e `setState`.
- Armazenamento local com `shared_preferences`.
- Recuperação automática dos livros cadastrados.
- Mensagens de confirmação utilizando `SnackBar`.

## Tecnologias Utilizadas

- Flutter
- Dart
- SharedPreferences
- Material Design

## Estrutura do Projeto

```text
TP7_Leituras_Basico/
├── lib/
│   └── main.dart
├── test/
│   └── widget_test.dart
├── pubspec.yaml
├── analysis_options.yaml
└── README.md
```

O aplicativo possui duas telas principais:

1. **Tela Inicial:** apresenta a lista de livros cadastrados e permite excluir livros.
2. **Tela de Cadastro:** permite informar o título, autor e status da leitura.

## Como Executar

### 1. Abrir o projeto

Abra a pasta do projeto no Visual Studio Code.

### 2. Instalar as dependências

No terminal, execute:

```bash
flutter pub get
```

### 3. Executar o aplicativo

Para executar no Google Chrome utilizando uma porta fixa:

```bash
flutter run -d chrome --web-port 8080
```

O aplicativo estará disponível em:

http://localhost:8080

## Armazenamento Local

O aplicativo utiliza o pacote `shared_preferences` para armazenar os livros localmente.

Os dados são convertidos para o formato JSON e salvos utilizando uma chave chamada `livros`.

Cada livro contém três informações:

- Título
- Autor
- Status da leitura

Ao iniciar o aplicativo, os dados armazenados são recuperados automaticamente e apresentados na lista.

Não são utilizados SQLite ou bancos de dados externos.

## Persistência dos Dados

No Flutter Web, o armazenamento local depende da origem utilizada pelo navegador.

Por isso, recomenda-se executar o aplicativo utilizando sempre a mesma porta:

```bash
flutter run -d chrome --web-port 8080
```

### Teste de Persistência

1. Abra o aplicativo no Chrome.
2. Cadastre um ou mais livros.
3. Atualize a página utilizando `F5`.
4. Verifique se os livros continuam cadastrados.
5. Encerre a execução do Flutter.
6. Execute novamente utilizando a porta `8080`.
7. Confira se os livros foram recuperados.

Os dados permanecem disponíveis desde que o armazenamento do site não seja apagado e o mesmo navegador e origem sejam utilizados.

## Referências

- [Shared Preferences – pub.dev](https://pub.dev/packages/shared_preferences)
- [Navegação entre telas – Flutter](https://docs.flutter.dev/cookbook/navigation/navigation-basics)

## Informações Acadêmicas

**Atividade:** TP7 – App de Organização de Leituras  
**Linguagem:** Dart  
**Framework:** Flutter  
**Instituição:** FATEC Rubens Lara  
**Curso:** Sistemas para Internet  
**Integrante:** Vivian Gomes Leal da Rocha Santos