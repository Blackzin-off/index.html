import 'package:flutter/material.dart';

import '../../model/peca.dart';
import '../theme/tema_app.dart';

/// Item da lista de peças: nome, código/fabricante, preço e botão de ação.
class LinhaPeca extends StatelessWidget {
  final Peca peca;
  final bool selecionada;
  final VoidCallback onTocar;
  final VoidCallback onAdicionar;
  const LinhaPeca({super.key, required this.peca, required this.selecionada, required this.onTocar, required this.onAdicionar});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTocar,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Cores.painel,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: selecionada ? Cores.laranja : Cores.borda),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(peca.nome, style: const TextStyle(color: Cores.creme, fontWeight: FontWeight.bold, fontSize: 14)),
                  Text('${peca.codigo} · ${peca.categoria} · ${peca.fabricante}', style: const TextStyle(color: Cores.cinza, fontSize: 11)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('R\$ ${peca.precoVenda.toStringAsFixed(2)}', style: const TextStyle(color: Cores.creme, fontWeight: FontWeight.bold, fontSize: 13)),
                const SizedBox(height: 6),
                peca.origemBase
                    ? GestureDetector(
                        onTap: onAdicionar,
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(color: Cores.laranja, borderRadius: BorderRadius.circular(6)),
                          child: const Icon(Icons.add, color: Colors.black, size: 18),
                        ),
                      )
                    : const Icon(Icons.check_circle, color: Cores.verde, size: 22),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
