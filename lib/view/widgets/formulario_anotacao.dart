import 'package:flutter/material.dart';

import '../../model/anotacao.dart';
import '../theme/tema_app.dart';

/// Formulário fixo para registrar uma nova anotação sobre uma peça.
class FormularioAnotacao extends StatefulWidget {
  final ValueChanged<Anotacao> onSalvar;
  const FormularioAnotacao({super.key, required this.onSalvar});
  @override
  State<FormularioAnotacao> createState() => _FormularioAnotacaoState();
}

class _FormularioAnotacaoState extends State<FormularioAnotacao> {
  final _peca = TextEditingController();
  final _texto = TextEditingController();
  String _status = 'PENDENTE';
  static const _opcoes = ['URGENTE', 'PENDENTE', 'REVISADO'];

  void _salvar() {
    if (_texto.text.trim().isEmpty || _peca.text.trim().isEmpty) return;
    widget.onSalvar(Anotacao(peca: _peca.text, texto: _texto.text, status: _status, autor: 'Rafael Carvalho', data: 'agora'));
    _peca.clear();
    _texto.clear();
    setState(() => _status = 'PENDENTE');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(color: Cores.painel, borderRadius: BorderRadius.circular(10), border: Border.all(color: Cores.borda)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('NOVA ANOTAÇÃO', style: TextStyle(color: Cores.creme, fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 14),
          const Text('PEÇA RELACIONADA', style: TextStyle(color: Cores.cinza, fontSize: 10)),
          const SizedBox(height: 6),
          TextField(controller: _peca, style: const TextStyle(color: Cores.creme), decoration: const InputDecoration(hintText: 'Nome da peça')),
          const SizedBox(height: 14),
          const Text('ANOTAÇÃO', style: TextStyle(color: Cores.cinza, fontSize: 10)),
          const SizedBox(height: 6),
          TextField(controller: _texto, maxLines: 4, style: const TextStyle(color: Cores.creme), decoration: const InputDecoration(hintText: 'Descreva o que for importante...')),
          const SizedBox(height: 14),
          const Text('MARCAR COMO', style: TextStyle(color: Cores.cinza, fontSize: 10)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: _opcoes.map((o) {
              final sel = o == _status;
              return ChoiceChip(
                label: Text(o[0] + o.substring(1).toLowerCase()),
                selected: sel,
                onSelected: (_) => setState(() => _status = o),
                backgroundColor: Cores.fundo,
                selectedColor: Cores.laranja.withOpacity(0.2),
                labelStyle: TextStyle(color: sel ? Cores.laranjaClaro : Cores.cinza, fontSize: 12),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: _salvar, child: const Text('SALVAR ANOTAÇÃO'))),
        ],
      ),
    );
  }
}
