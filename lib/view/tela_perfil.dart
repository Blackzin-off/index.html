import 'package:flutter/material.dart';

import '../model/usuario.dart';
import 'theme/tema_app.dart';
import 'widgets/cartao_estatistica.dart';
import 'widgets/cartao_turno.dart';
import 'widgets/linha_servico.dart';

/// Tela de Perfil: dados do funcionário logado, estatísticas e serviços recentes.
class TelaPerfil extends StatelessWidget {
  final Usuario usuario;
  const TelaPerfil({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 300, child: _cartaoPerfil()),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Expanded(child: CartaoEstatistica(numero: '128', legenda: 'Serviços\nconcluídos')),
                  SizedBox(width: 12),
                  Expanded(child: CartaoEstatistica(numero: '4.8', legenda: 'Avaliação média\ndos clientes')),
                  SizedBox(width: 12),
                  Expanded(child: CartaoEstatistica(numero: '1h40', legenda: 'Tempo médio\npor serviço')),
                ],
              ),
              const SizedBox(height: 16),
              const CartaoTurno(),
              const SizedBox(height: 20),
              const Text('SERVIÇOS RECENTES', style: TextStyle(color: Cores.creme, fontSize: 13, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Expanded(
                child: ListView(
                  children: const [
                    LinhaServico(veiculo: 'VW Gol · JJK-8890', descricao: 'Revisão completa 40.000km', cliente: 'Marcos Antunes', data: 'Hoje, 09:20', status: 'Em andamento'),
                    LinhaServico(veiculo: 'Hyundai HB20 · ASD-9021', descricao: 'Troca de pastilhas de freio', cliente: 'Fernanda Lima', data: 'Ontem, 15:40', status: 'Concluído'),
                    LinhaServico(veiculo: 'Fiat Toro · GHT-3345', descricao: 'Troca de óleo e filtros', cliente: 'Carlos Souza', data: '22 ago, 14:05', status: 'Concluído'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _cartaoPerfil() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Cores.painel, borderRadius: BorderRadius.circular(10), border: Border.all(color: Cores.borda)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(radius: 32, backgroundColor: Cores.laranja, child: Text(usuario.iniciais, style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold))),
          ),
          const SizedBox(height: 14),
          Center(child: Text(usuario.nome, style: const TextStyle(color: Cores.creme, fontSize: 18, fontWeight: FontWeight.bold))),
          Center(child: Text(usuario.cargo.toUpperCase(), style: const TextStyle(color: Cores.laranjaClaro, fontSize: 12, fontWeight: FontWeight.bold))),
          const SizedBox(height: 20),
          const Divider(color: Cores.borda),
          _campo('MATRÍCULA', usuario.matricula),
          _campo('E-MAIL', usuario.email),
          _campo('TELEFONE', usuario.telefone),
          _campo('NA EQUIPE DESDE', usuario.desde),
          const SizedBox(height: 8),
          SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () {}, child: const Text('EDITAR PERFIL'))),
        ],
      ),
    );
  }

  Widget _campo(String rotulo, String valor) {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
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
