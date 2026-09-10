import 'package:flutter/material.dart';

import 'theme/tema_app.dart';
import 'widgets/cabecalho_marca.dart';
import 'widgets/formulario_login.dart';

class TelaLogin extends StatelessWidget {
  const TelaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.fundo,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CabecalhoMarca(),
                  SizedBox(height: 48),
                  Text('ACESSO AO SISTEMA', style: TextStyle(color: Cores.laranja, fontSize: 12, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Entrar', style: TextStyle(color: Cores.creme, fontSize: 28, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Acesse sua conta para gerenciar a oficina.', style: TextStyle(color: Cores.cinza, fontSize: 14)),
                  SizedBox(height: 28),
                  FormularioLogin(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}