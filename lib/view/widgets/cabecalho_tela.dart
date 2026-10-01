import 'package:flutter/material.dart';

import '../../model/usuario.dart';
import '../theme/tema_app.dart';

/// Cabeçalho de topo: título/subtítulo da tela atual + dados do usuário.
class CabecalhoTela extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final Usuario usuario;
  const CabecalhoTela({super.key, required this.titulo, required this.subtitulo, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 24, 28, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo, style: const TextStyle(color: Cores.creme, fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitulo, style: const TextStyle(color: Cores.cinza, fontSize: 13)),
              ],
            ),
          ),
          CircleAvatar(radius: 20, backgroundColor: Cores.laranja, child: Text(usuario.iniciais, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(usuario.nome, style: const TextStyle(color: Cores.creme, fontWeight: FontWeight.bold)),
              Text(usuario.cargo, style: const TextStyle(color: Cores.cinza, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
