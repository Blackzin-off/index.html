import 'package:flutter/material.dart';
import '../theme/tema_app.dart';

class PainelMarca extends StatelessWidget {
  const PainelMarca({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Cores.fundo,
      padding: const EdgeInsets.all(48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: Stack(alignment: Alignment.center, children: [
              Transform.rotate(angle: 0.785, child: Container(width: 40, height: 9, color: Cores.laranja)),
              Transform.rotate(angle: -0.785, child: Container(width: 40, height: 9, color: Cores.laranja)),
            ]),
          ),
          const SizedBox(height: 32),
          RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900),
              children: [
                TextSpan(text: 'AVANT', style: TextStyle(color: Cores.creme)),
                TextSpan(text: 'GARDE', style: TextStyle(color: Cores.laranja)),
              ],
            ),
          ),
          const SizedBox(height: 6),
          const Text('GESTÃO DE OFICINA MECÂNICA',
              style: TextStyle(color: Cores.cinza, fontSize: 11, letterSpacing: 3, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Container(width: 56, height: 4, color: Cores.laranja),
          const SizedBox(height: 16),
          const Text(
            'Controle de peças, ordens de serviço e equipe em um único painel. Manutenção com precisão de linha de montagem.',
            style: TextStyle(color: Cores.cinza, fontSize: 13, height: 1.6),
          ),
        ],
      ),
    );
  }
}