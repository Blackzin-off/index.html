import 'package:flutter/material.dart';

import '../controller/controlador_pecas.dart';
import '../model/peca.dart';
import 'theme/tema_app.dart';
import 'widgets/linha_peca.dart';

class TelaPecas extends StatefulWidget {
  const TelaPecas({super.key});
  @override
  State<TelaPecas> createState() => _TelaPecasState();
}

class _TelaPecasState extends State<TelaPecas> {
  final _controlador = ControladorPecas();
  final _busca = TextEditingController();
  String _categoria = 'Todas';
  static const _categorias = ['Todas', 'Motor', 'Freios', 'Suspensão', 'Elétrica', 'Filtros'];

  void _adicionar(Peca peca) {
    setState(() => _controlador.cadastrarNoEstoque(peca));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${peca.nome} cadastrada no estoque!')));
  }

  @override
  Widget build(BuildContext context) {
    final pecas = _controlador.buscar(_busca.text, _categoria);
    return Scaffold(
      backgroundColor: Cores.fundo,
      appBar: AppBar(backgroundColor: Cores.fundo, elevation: 0, title: const Text('Cadastro de Peças', style: TextStyle(color: Cores.creme, fontWeight: FontWeight.bold))),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _busca,
              onChanged: (_) => setState(() {}),
              style: const TextStyle(color: Cores.creme),
              decoration: const InputDecoration(hintText: 'Buscar por nome ou código...', prefixIcon: Icon(Icons.search, color: Cores.cinza)),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 34,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _categorias.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) {
                  final cat = _categorias[i];
                  final selecionada = cat == _categoria;
                  return ChoiceChip(
                    label: Text(cat),
                    selected: selecionada,
                    onSelected: (_) => setState(() => _categoria = cat),
                    backgroundColor: Cores.painel,
                    selectedColor: Cores.laranja.withOpacity(0.2),
                    labelStyle: TextStyle(color: selecionada ? Cores.laranjaClaro : Cores.cinza, fontSize: 12),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: pecas.isEmpty
                  ? const Center(child: Text('Nenhuma peça encontrada.', style: TextStyle(color: Cores.cinza)))
                  : ListView.builder(
                itemCount: pecas.length,
                itemBuilder: (_, i) => LinhaPeca(peca: pecas[i], onAdicionar: () => _adicionar(pecas[i])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}