import 'package:flutter/material.dart';
import '../model/usuario.dart';
import 'theme/tema_app.dart';
import 'widgets/cartao_estatistica.dart';
import 'widgets/linha_servico.dart';
import 'widgets/saudacao_usuario.dart';

class TelaDashboard extends StatelessWidget {
  final Usuario usuario;
  const TelaDashboard({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.fundo,
      appBar: AppBar(
        backgroundColor: Cores.fundo,
        elevation: 0,
        title: const Text('Dashboard', style: TextStyle(color: Cores.creme,
            fontWeight: FontWeight.bold)),
        actions: [IconButton(onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.logout, color: Cores.cinza))],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            SaudacaoUsuario(usuario: usuario),
            const SizedBox(height: 28),
            Row(
              children: const [
                Expanded(child: CartaoEstatistica(numero: '7',
                    legenda: 'Serviços\nem andamento')),
                SizedBox(width: 12),
                Expanded(child: CartaoEstatistica(numero: '14',
                    legenda: 'Peças\ncadastradas')),
                SizedBox(width: 12),
                Expanded(child: CartaoEstatistica(numero: '3',
                    legenda: 'Anotações\npendentes')),
              ],
            ),
            const SizedBox(height: 28),
            const Text('SERVIÇOS RECENTES', style: TextStyle(color: Cores.creme,
                fontSize: 13, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const LinhaServico(veiculo: 'VW Gol · JJK-8890',
                descricao: 'Revisão completa 40.000km',
                status: 'Em andamento'),

            const LinhaServico(veiculo: 'Honda Civic · XYZ-4F56',
                descricao: 'Diagnóstico de freios',
                status: 'Aguardando'),

            const LinhaServico(veiculo: 'Ford Ka · POI-5567',
                descricao: 'Alinhamento e balanceamento',
                status: 'Concluído'),
          ],
        ),
      ),
    );
  }
}