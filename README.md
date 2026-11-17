# TP7 - Minha Estante

Aplicativo simples de organizacao de leituras, desenvolvido em Flutter/Dart.

**Integrante:** Vivian Gomes Leal.

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

## Teste manual sugerido
1. Abra o aplicativo com a lista vazia.
2. Cadastre um livro com titulo, autor e cada status.
3. Verifique a exibicao no ListView.
4. Feche e reabra: os livros devem permanecer.
5. Exclua um livro; feche e reabra novamente.

## Referencias oficiais
- https://pub.dev/packages/shared_preferences
- https://docs.flutter.dev/cookbook/navigation/navigation-basics

