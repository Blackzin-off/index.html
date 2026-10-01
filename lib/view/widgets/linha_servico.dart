import 'package:flutter/material.dart';

import '../theme/tema_app.dart';

/// Linha de um serviço recente, usada na tela de Perfil.
class LinhaServico extends StatelessWidget {
  final String veiculo;
  final String descricao;
  final String cliente;
  final String data;
  final String status;
  const LinhaServico({super.key, required this.veiculo, required this.descricao, required this.cliente, required this.data, required this.status});

  Color get _cor {
    if (status == 'Em andamento') return Cores.laranjaClaro;
    if (status == 'Concluído') return Cores.verde;
    return Cores.cinza;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Cores.painel, borderRadius: BorderRadius.circular(10), border: Border.all(color: Cores.borda)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$veiculo — $descricao', style: const TextStyle(color: Cores.creme, fontWeight: FontWeight.bold, fontSize: 13), overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Text('Cliente: $cliente', style: const TextStyle(color: Cores.cinza, fontSize: 11)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(data, style: const TextStyle(color: Cores.cinza, fontSize: 11)),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: _cor.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
                child: Text(status.toUpperCase(), style: TextStyle(color: _cor, fontSize: 10, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
