import 'package:flutter/material.dart';

import '../theme/tema_app.dart';

class CartaoEstatistica extends StatelessWidget {
  final String numero;
  final String legenda;
  const CartaoEstatistica({super.key, required this.numero, required this.legenda});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Cores.painel,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Cores.borda)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(numero, style: const TextStyle(
              color: Cores.creme,
              fontSize: 24,
              fontWeight: FontWeight.bold)
          ),
          const SizedBox(height: 6),
          Text(legenda, style: const TextStyle(
              color: Cores.cinza,
              fontSize: 11,
              height: 1.3)
          ),
        ],
      ),
    );
  }
}