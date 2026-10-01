import 'package:flutter/material.dart';

import '../controller/controlador_anotacoes.dart';
import '../model/anotacao.dart';
import 'theme/tema_app.dart';
import 'widgets/cartao_anotacao.dart';

class TelaAnotacoes extends StatefulWidget {
  const TelaAnotacoes({super.key});
  @override
  State<TelaAnotacoes> createState() => _TelaAnotacoesState();
}

class _TelaAnotacoesState extends State<TelaAnotacoes> {
  final _controlador = ControladorAnotacoes();
  final _peca = TextEditingController();
  final _texto = TextEditingController();

  void _abrirFormulario() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Cores.painel,
        title: const Text('Nova Anotação', style: TextStyle(color: Cores.creme)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: _peca, style: const TextStyle(color: Cores.creme), decoration: const InputDecoration(hintText: 'Peça relacionada')),
            TextField(controller: _texto, style: const TextStyle(color: Cores.creme), decoration: const InputDecoration(hintText: 'Anotação'), maxLines: 3),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
          TextButton(
            onPressed: () {
              if (_texto.text.trim().isEmpty) return;
              setState(() => _controlador.adicionar(
                  Anotacao(peca: _peca.text, texto: _texto.text, status: 'PENDENTE', autor: 'Rafael Carvalho', data: 'agora')));
              _peca.clear();
              _texto.clear();
              Navigator.pop(context);
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final anotacoes = _controlador.listar();
    return Scaffold(
      backgroundColor: Cores.fundo,
      appBar: AppBar(backgroundColor: Cores.fundo, elevation: 0, title: const Text('Anotações', style: TextStyle(color: Cores.creme, fontWeight: FontWeight.bold))),
      floatingActionButton: FloatingActionButton(onPressed: _abrirFormulario, backgroundColor: Cores.laranja, child: const Icon(Icons.add, color: Colors.black)),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: anotacoes.length,
        itemBuilder: (_, i) => CartaoAnotacao(anotacao: anotacoes[i]),
      ),
    );
  }
}