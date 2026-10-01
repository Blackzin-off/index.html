import 'package:flutter/material.dart';

import '../theme/tema_app.dart';

/// Barra lateral fixa com a marca e a navegação entre as telas internas.
class BarraLateral extends StatelessWidget {
  final int indiceAtual;
  final ValueChanged<int> aoSelecionar;
  final VoidCallback aoSair;
  const BarraLateral({super.key, required this.indiceAtual, required this.aoSelecionar, required this.aoSair});

  static const _itens = ['Peças', 'Anotações', 'Serviços', 'Perfil'];
  static const _icones = [Icons.build_outlined, Icons.sticky_note_2_outlined, Icons.assignment_outlined, Icons.person_outline];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      color: Cores.fundo,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              children: [
                TextSpan(text: 'AVANT', style: TextStyle(color: Cores.creme)),
                TextSpan(text: 'GARDE', style: TextStyle(color: Cores.laranja)),
              ],
            ),
          ),
          const Text('OFICINA', style: TextStyle(color: Cores.cinza, fontSize: 10, letterSpacing: 3)),
          const SizedBox(height: 24),
          const Divider(color: Cores.laranja, thickness: 1),
          const SizedBox(height: 16),
          for (var i = 0; i < _itens.length; i++) _item(i),
          const Spacer(),
          TextButton.icon(
            onPressed: aoSair,
            icon: const Icon(Icons.logout, size: 16, color: Cores.cinza),
            label: const Text('SAIR', style: TextStyle(color: Cores.cinza, fontSize: 12)),
          ),
          const Text('VERSÃO 2.4.1', style: TextStyle(color: Cores.cinza, fontSize: 10)),
          const Text('OFICINA CENTRAL — UNIDADE 01', style: TextStyle(color: Cores.cinza, fontSize: 10)),
        ],
      ),
    );
  }

  Widget _item(int i) {
    final selecionado = i == indiceAtual;
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => aoSelecionar(i),
          borderRadius: BorderRadius.circular(6),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              border: Border(left: BorderSide(color: selecionado ? Cores.laranja : Colors.transparent, width: 3)),
            ),
            child: Row(
              children: [
                Icon(_icones[i], size: 18, color: selecionado ? Cores.laranja : Cores.cinza),
                const SizedBox(width: 10),
                Text(_itens[i], style: TextStyle(color: selecionado ? Cores.creme : Cores.cinza, fontWeight: selecionado ? FontWeight.bold : FontWeight.normal)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}