import 'package:flutter/material.dart';

import '../controller/controlador_servicos.dart';
import 'theme/tema_app.dart';
import 'widgets/cartao_servico.dart';

class TelaServicos extends StatefulWidget {
  const TelaServicos({super.key});
  @override
  State<TelaServicos> createState() => _TelaServicosState();
}

class _TelaServicosState extends State<TelaServicos> with SingleTickerProviderStateMixin {
  final _controlador = ControladorServicos();
  late final _abas = TabController(length: 3, vsync: this);
  static const _status = ['Aguardando', 'Em andamento', 'Concluído'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.fundo,
      appBar: AppBar(
        backgroundColor: Cores.fundo,
        elevation: 0,
        title: const Text('Serviços', style: TextStyle(color: Cores.creme, fontWeight: FontWeight.bold)),
        bottom: TabBar(
          controller: _abas,
          indicatorColor: Cores.laranja,
          labelColor: Cores.creme,
          unselectedLabelColor: Cores.cinza,
          tabs: _status.map((s) => Tab(text: s)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _abas,
        children: _status.map((s) {
          final lista = _controlador.listarPorStatus(s);
          if (lista.isEmpty) return const Center(child: Text('Nenhum serviço aqui.', style: TextStyle(color: Cores.cinza)));
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: lista.length,
            itemBuilder: (_, i) => CartaoServico(servico: lista[i]),
          );
        }).toList(),
      ),
    );
  }
}