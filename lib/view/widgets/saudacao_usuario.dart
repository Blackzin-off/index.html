import 'package:flutter/material.dart';
import '../../model/usuario.dart';
import '../theme/tema_app.dart';

class SaudacaoUsuario extends StatelessWidget {
  final Usuario usuario;
  const SaudacaoUsuario({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: const BoxDecoration(
              color: Cores.laranja,
              shape: BoxShape.circle),
          alignment: Alignment.center,
          child: Text(usuario.iniciais, style:
          const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold)),
        ),

        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Olá, ${usuario.nome.split(' ').first}', style:
            const TextStyle(
                color: Cores.creme,
                fontSize: 18,
                fontWeight: FontWeight.bold)
            ),

            Text(usuario.cargo, style: const TextStyle(
                color: Cores.cinza,
                fontSize: 12)
            ),
          ],
        ),
      ],
    );
  }
}