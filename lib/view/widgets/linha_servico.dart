import 'package:flutter/material.dart';
import '../theme/tema_app.dart';

class LinhaServico extends StatelessWidget {
  final String veiculo;
  final String descricao;
  final String status;
  const LinhaServico({super.key, required this.veiculo, required this.descricao, required this.status});

  Color get _cor {
    if (status == 'Concluído') return Cores.verde;
    if (status == 'Em andamento') return Cores.laranjaClaro;
    return Cores.cinza;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: Cores.painel,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Cores.borda)),

      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(veiculo, style: const TextStyle(color: Cores.creme, fontWeight: FontWeight.bold, fontSize: 13)),
                Text(descricao, style: const TextStyle(color: Cores.cinza, fontSize: 12)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: _cor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20)),
            child: Text(status, style: TextStyle(
                color: _cor,
                fontSize: 10,
                fontWeight:
                FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}