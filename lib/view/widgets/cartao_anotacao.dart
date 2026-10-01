import 'package:flutter/material.dart';

import '../../model/anotacao.dart';
import '../theme/tema_app.dart';

class CartaoAnotacao extends StatelessWidget {
  final Anotacao anotacao;
  const CartaoAnotacao({super.key, required this.anotacao});

  Color get _cor {
    if (anotacao.status == 'URGENTE') return Cores.laranjaClaro;
    if (anotacao.status == 'REVISADO') return Cores.verde;
    return Cores.cinza;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Cores.painel, borderRadius: BorderRadius.circular(10), border: Border.all(color: Cores.borda)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(anotacao.peca, style: const TextStyle(color: Cores.creme, fontWeight: FontWeight.bold, fontSize: 14))),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: _cor.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
                child: Text(anotacao.status, style: TextStyle(color: _cor, fontSize: 10, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(anotacao.texto, style: const TextStyle(color: Cores.cinza, fontSize: 13)),
          const SizedBox(height: 8),
          Text('${anotacao.autor} · ${anotacao.data}', style: const TextStyle(color: Cores.cinza, fontSize: 11)),
        ],
      ),
    );
  }
}