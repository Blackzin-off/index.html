import 'package:flutter/material.dart';

import '../theme/tema_app.dart';

/// Card com o turno de trabalho do funcionário.
class CartaoTurno extends StatelessWidget {
  const CartaoTurno({super.key});

  static const _linhas = [
    ['Segunda a Sexta', '08:00 — 18:00', 'ATIVO'],
    ['Sábado', '08:00 — 13:00', 'ATIVO'],
    ['Domingo', 'Folga', 'INATIVO'],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(color: Cores.painel, borderRadius: BorderRadius.circular(10), border: Border.all(color: Cores.borda)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('TURNO DE TRABALHO', style: TextStyle(color: Cores.creme, fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(height: 12),
          for (final l in _linhas)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Expanded(child: Text(l[0], style: const TextStyle(color: Cores.creme, fontSize: 13))),
                  Text(l[1], style: const TextStyle(color: Cores.cinza, fontSize: 13)),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: (l[2] == 'ATIVO' ? Cores.verde : Cores.cinza).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(l[2], style: TextStyle(color: l[2] == 'ATIVO' ? Cores.verde : Cores.cinza, fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
