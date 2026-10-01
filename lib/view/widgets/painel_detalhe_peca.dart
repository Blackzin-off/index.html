import 'package:flutter/material.dart';

import '../../model/peca.dart';
import '../theme/tema_app.dart';

/// Painel lateral com os dados da peça selecionada, igual ao mockup.
class PainelDetalhePeca extends StatelessWidget {
  final Peca peca;
  final VoidCallback onCadastrar;
  const PainelDetalhePeca({super.key, required this.peca, required this.onCadastrar});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(color: Cores.painel, borderRadius: BorderRadius.circular(10), border: Border.all(color: Cores.borda)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('DADOS DA PEÇA', style: TextStyle(color: Cores.creme, fontWeight: FontWeight.bold, fontSize: 13)),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: Cores.laranja.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
                child: Text(peca.origemBase ? 'DA BASE' : 'NO ESTOQUE', style: const TextStyle(color: Cores.laranjaClaro, fontSize: 9, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 14),
          _campo('NOME', peca.nome),
          Row(children: [Expanded(child: _campo('CÓDIGO', peca.codigo)), const SizedBox(width: 12), Expanded(child: _campo('CATEGORIA', peca.categoria))]),
          _campo('FABRICANTE', peca.fabricante),
          Row(children: [
            Expanded(child: _campo('PREÇO DE CUSTO', 'R\$ ${peca.precoCusto.toStringAsFixed(2)}')),
            const SizedBox(width: 12),
            Expanded(child: _campo('PREÇO DE VENDA', 'R\$ ${peca.precoVenda.toStringAsFixed(2)}')),
          ]),
          _campo('QTD. EM ESTOQUE', '${peca.quantidadeEstoque} un.'),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: peca.origemBase ? onCadastrar : null, child: const Text('CADASTRAR PEÇA NO ESTOQUE')),
          ),
        ],
      ),
    );
  }

  Widget _campo(String rotulo, String valor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(rotulo, style: const TextStyle(color: Cores.cinza, fontSize: 10)),
          const SizedBox(height: 4),
          Text(valor, style: const TextStyle(color: Cores.creme, fontSize: 13)),
        ],
      ),
    );
  }
}
