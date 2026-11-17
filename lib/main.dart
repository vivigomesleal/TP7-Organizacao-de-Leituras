
// Integrante: Vivian Gomes Leal


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MeuAplicativo());
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Estante',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF5F6FA),
      ),
      home: const TelaInicial(),
    );
  }
}

// Tela inicial: lista os livros e permite exclui-los.
class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  List<Map<String, String>> livros = [];

  @override
  void initState() {
    super.initState();
    carregarLivros();
  }

 
  Future<void> carregarLivros() async {
    final prefs = await SharedPreferences.getInstance();
    final texto = prefs.getString('livros');

    if (texto != null) {
      try {
        final dados = jsonDecode(texto) as List<dynamic>;
        final lista = dados.map((item) {
          final livro = item as Map<String, dynamic>;
          return <String, String>{
            'titulo': livro['titulo'].toString(),
            'autor': livro['autor'].toString(),
            'status': livro['status'].toString(),
          };
        }).toList();

        if (!mounted) return;
        setState(() {
          livros = lista;
        });
      } catch (erro) {
        if (!mounted) return;
        mostrarMensagem('Nao foi possivel carregar os livros.');
      }
    }
  }

  Future<void> salvarLivros() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('livros', jsonEncode(livros));
  }

  void mostrarMensagem(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem)),
    );
  }

  Future<void> cadastrarLivro() async {
    final novoLivro = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(builder: (context) => const TelaCadastro()),
    );

    if (!mounted) return;
    if (novoLivro != null) {
      setState(() {
        livros.add(novoLivro);
      });
      await salvarLivros();
      if (!mounted) return;
      mostrarMensagem('Livro adicionado com sucesso!');
    }
  }

  Future<void> removerLivro(int indice) async {
    setState(() {
      livros.removeAt(indice);
    });
    await salvarLivros();
    if (!mounted) return;
    mostrarMensagem('Livro removido com sucesso!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Minha Estante', style: TextStyle(fontSize: 20)),
            Text(
              'Vivian Gomes Leal',
              style: TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
      body: livros.isEmpty
          ? const Center(
              child: Text(
                'Nenhum livro cadastrado.\nToque em + para adicionar.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, color: Colors.black54),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: livros.length,
              itemBuilder: (context, indice) {
                final livro = livros[indice];
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: const Icon(Icons.menu_book, color: Colors.indigo),
                    title: Text(livro['titulo'] ?? ''),
                    subtitle: Text(
                      'Autor: ${livro['autor']}\nStatus: ${livro['status']}',
                    ),
                    isThreeLine: true,
                    trailing: IconButton(
                      tooltip: 'Remover livro',
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () => removerLivro(indice),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: cadastrarLivro,
        tooltip: 'Cadastrar livro',
        child: const Icon(Icons.add),
      ),
    );
  }
}


class TelaCadastro extends StatefulWidget {
  const TelaCadastro({Key? key}) : super(key: key);

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final tituloController = TextEditingController();
  final autorController = TextEditingController();
  String status = 'Quero ler';

  @override
  void dispose() {
    tituloController.dispose();
    autorController.dispose();
    super.dispose();
  }

  void salvar() {
    final titulo = tituloController.text.trim();
    final autor = autorController.text.trim();

    if (titulo.isEmpty || autor.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha o titulo e o autor.')),
      );
      return;
    }

    Navigator.pop(context, <String, String>{
      'titulo': titulo,
      'autor': autor,
      'status': status,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cadastrar livro', style: TextStyle(fontSize: 20)),
            Text(
              'Vivian Gomes Leal da Rocha Santos',
              style: TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Novo livro', style: TextStyle(fontSize: 22)),
            const SizedBox(height: 20),
            TextField(
              controller: tituloController,
              decoration: const InputDecoration(
                labelText: 'Titulo do livro',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: autorController,
              decoration: const InputDecoration(
                labelText: 'Autor',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Status da leitura',
                border: OutlineInputBorder(),
              ),
              child: DropdownButton<String>(
                value: status,
                isExpanded: true,
                underline: const SizedBox(),
                items: ['Quero ler', 'Lendo', 'Concluído'].map((opcao) {
                  return DropdownMenuItem<String>(
                    value: opcao,
                    child: Text(opcao),
                  );
                }).toList(),
                onChanged: (valor) {
                  if (valor != null) {
                    setState(() {
                      status = valor;
                    });
                  }
                },
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: salvar,
              icon: const Icon(Icons.save),
              label: const Text('Salvar livro'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
