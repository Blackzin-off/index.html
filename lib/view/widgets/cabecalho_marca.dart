import 'package:flutter/material.dart';

import '../theme/tema_app.dart';

class CabecalhoMarca extends StatelessWidget {
  const CabecalhoMarca({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
            children: [
              TextSpan(text: 'AVANT', style: TextStyle(color: Cores.creme)),
              TextSpan(text: 'GARDE', style: TextStyle(color: Cores.laranja)),
            ],
          ),
        ),
        const SizedBox(height: 6),
        const Text('GESTÃO DE OFICINA MECÂNICA',
            style: TextStyle(color: Cores.cinza, fontSize: 11, letterSpacing: 2, fontWeight: FontWeight.bold)),
      ],
    );
  }
}