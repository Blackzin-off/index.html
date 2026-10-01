import 'package:flutter/material.dart';

import '../model/usuario.dart';
import 'theme/tema_app.dart';
import 'tela_anotacoes.dart';
import 'tela_pecas.dart';
import 'tela_perfil.dart';
import 'tela_servicos.dart';

class TelaPrincipal extends StatefulWidget {
  final Usuario usuario;
  const TelaPrincipal({super.key, required this.usuario});
  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int _indice = 0;

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
      body: IndexedStack(index: _indice, children: telas),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Cores.painel,
        currentIndex: _indice,
        onTap: (i) => setState(() => _indice = i),
        selectedItemColor: Cores.laranja,
        unselectedItemColor: Cores.cinza,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.build_outlined), label: 'Peças'),
          BottomNavigationBarItem(icon: Icon(Icons.sticky_note_2_outlined), label: 'Anotações'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment_outlined), label: 'Serviços'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Perfil'),
        ],
      ),
    );
  }
}