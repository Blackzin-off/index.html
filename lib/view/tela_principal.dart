import 'package:flutter/material.dart';

import '../model/usuario.dart';
import 'tela_login.dart';
import 'theme/tema_app.dart';
import 'tela_anotacoes.dart';
import 'tela_pecas.dart';
import 'tela_perfil.dart';
import 'tela_servicos.dart';
import 'widgets/barra_lateral.dart';
import 'widgets/cabecalho_tela.dart';

/// Casca com a barra lateral e o cabeçalho, trocando entre as 4 telas
/// internas (Peças, Anotações, Serviços, Perfil) sem perder o estado.
class TelaPrincipal extends StatefulWidget {
  final Usuario usuario;
  const TelaPrincipal({super.key, required this.usuario});
  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int _indice = 0;

  static const _titulos = ['Cadastro de Peças', 'Anotações de Peças', 'Serviços em Andamento', 'Meu Perfil'];
  static const _subtitulos = [
    'Busque na base de dados e cadastre no estoque da oficina',
    'Registre observações antes de cadastrar uma peça no sistema',
    'Acompanhe todas as ordens de serviço da oficina em tempo real',
    'Dados do funcionário logado no sistema',
  ];

  void _sair() {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const TelaLogin()), (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    final telas = [
      const TelaPecas(),
      const TelaAnotacoes(),
      const TelaServicos(),
      TelaPerfil(usuario: widget.usuario),
    ];
    return Scaffold(
      backgroundColor: Cores.fundo,
      body: Row(
        children: [
          BarraLateral(indiceAtual: _indice, aoSelecionar: (i) => setState(() => _indice = i), aoSair: _sair),
          Container(width: 1, color: Cores.borda),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CabecalhoTela(titulo: _titulos[_indice], subtitulo: _subtitulos[_indice], usuario: widget.usuario),
                Container(height: 1, color: Cores.borda),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: IndexedStack(index: _indice, children: telas),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
