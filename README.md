# TP7 - Minha Estante

Aplicativo simples de organizacao de leituras, desenvolvido em Flutter/Dart.

**Integrante:** Vivian Gomes Leal da Rocha Santos.

## Requisitos atendidos
- Tela inicial com `ListView` dos livros.
- Segunda tela com `TextField` para titulo e autor.
- `DropdownButton` para Quero ler, Lendo e Concluido.
- Cadastro e exclusao de livros.
- Navegacao com `Navigator.push` e `Navigator.pop`.
- `StatefulWidget` e `setState`.
- Persistencia local com `shared_preferences`: a lista de livros e serializada em JSON e salva como uma unica string.
- Recuperacao dos dados em `initState`.
- Mensagens com `SnackBar` e `ScaffoldMessenger`.

## Estrutura
```
lib/main.dart
pubspec.yaml
README.md
```

## Abrir no VS Code
1. Extraia a pasta do projeto, por exemplo em `D:\\Projetos_Flutter\\TP7_Leituras_Basico`.
2. Abra **essa pasta** no VS Code (a que contem o `pubspec.yaml`).
3. No terminal, execute `flutter create .` para gerar as pastas nativas do Flutter, se estiverem ausentes.
4. Execute `flutter pub get`.
5. Execute `flutter run -d chrome`.

> O Flutter SDK pode estar em outro diretorio ou unidade. Configure `dart.flutterSdkPath` com o caminho real da instalacao do SDK.

## Teste manual sugerido
1. Abra o aplicativo com a lista vazia.
2. Cadastre um livro com titulo, autor e cada status.
3. Verifique a exibicao no ListView.
4. Feche e reabra: os livros devem permanecer.
5. Exclua um livro; feche e reabra novamente.

## Referencias oficiais
- https://pub.dev/packages/shared_preferences
- https://docs.flutter.dev/cookbook/navigation/navigation-basics

## Entrega no GitHub
O historico deste pacote possui 3 commits locais com as etapas de desenvolvimento. Crie um repositorio vazio no GitHub e envie a branch do projeto. Confira com `git log --oneline`.
