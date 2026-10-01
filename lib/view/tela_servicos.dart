import 'package:flutter/material.dart';

import '../controller/controlador_servicos.dart';
import 'theme/tema_app.dart';
import 'widgets/cartao_servico.dart';

/// Tela de Serviços: busca e um quadro com 3 colunas por status.
class TelaServicos extends StatefulWidget {
  const TelaServicos({super.key});
  @override
  State<TelaServicos> createState() => _TelaServicosState();
}

class _TelaServicosState extends State<TelaServicos> {
  final _controlador = ControladorServicos();
  final _busca = TextEditingController();

  static const _colunas = [
    ['Aguardando', 'AGUARDANDO'],
    ['Em andamento', 'EM ANDAMENTO'],
    ['Concluído', 'CONCLUÍDO'],
  ];
  static const _cores = [Cores.cinza, Cores.laranja, Cores.verde];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _busca,
          style: const TextStyle(color: Cores.creme),
          decoration: const InputDecoration(hintText: 'Buscar por veículo, placa ou mecânico...', prefixIcon: Icon(Icons.search, color: Cores.cinza)),
        ),
        const SizedBox(height: 18),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [for (var i = 0; i < _colunas.length; i++) ...[Expanded(child: _coluna(i)), if (i < _colunas.length - 1) const SizedBox(width: 16)]],
          ),
        ),
      ],
    );
  }

  Widget _coluna(int i) {
    final lista = _controlador.listarPorStatus(_colunas[i][0]);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 8, height: 8, decoration: BoxDecoration(color: _cores[i], shape: BoxShape.circle)),
            const SizedBox(width: 8),
            Text(_colunas[i][1], style: const TextStyle(color: Cores.creme, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1)),
            const SizedBox(width: 6),
            Text('${lista.length}', style: const TextStyle(color: Cores.cinza, fontSize: 12)),
          ],
        ),
        const SizedBox(height: 12),
        Expanded(
          child: lista.isEmpty
              ? const Text('Nenhum serviço aqui.', style: TextStyle(color: Cores.cinza, fontSize: 12))
              : ListView.builder(itemCount: lista.length, itemBuilder: (_, j) => CartaoServico(servico: lista[j])),
        ),
      ],
    );
  }
}
