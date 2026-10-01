import 'package:flutter/material.dart';

import '../../model/servico.dart';
import '../theme/tema_app.dart';

class CartaoServico extends StatelessWidget {
  final Servico servico;
  const CartaoServico({super.key, required this.servico});

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
              Expanded(child: Text('${servico.veiculo} · ${servico.placa}', style: const TextStyle(color: Cores.cinza, fontSize: 11))),
              if (servico.prioridade == 'Alta')
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(color: Cores.vermelho.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
                  child: const Text('PRIORIDADE ALTA', style: TextStyle(color: Cores.vermelho, fontSize: 9, fontWeight: FontWeight.bold)),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(servico.descricao, style: const TextStyle(color: Cores.creme, fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(child: Text(servico.mecanico, style: const TextStyle(color: Cores.cinza, fontSize: 12))),
              if (servico.tempo.isNotEmpty) Text(servico.tempo, style: const TextStyle(color: Cores.cinza, fontSize: 12)),
            ],
          ),
          if (servico.status == 'Em andamento') ...[
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(value: servico.progresso / 100, minHeight: 6, backgroundColor: Cores.borda, color: Cores.laranja),
            ),
          ],
        ],
      ),
    );
  }
}