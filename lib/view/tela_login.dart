import 'package:flutter/material.dart';
import 'theme/tema_app.dart';
import 'widgets/cabecalho_marca.dart';
import 'widgets/formulario_login.dart';
import 'widgets/painel_marca.dart';

class TelaLogin extends StatelessWidget {
  const TelaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cores.fundo,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final telaLarga = constraints.maxWidth > 900;
          if (!telaLarga) return SafeArea(child: _painelFormulario(comLogo: true));
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1440),
              child: Row(
                children: [
                  const Expanded(flex: 3, child: PainelMarca()),
                  Expanded(flex: 2, child: SafeArea(child: _painelFormulario(comLogo: false))),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _painelFormulario({required bool comLogo}) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (comLogo) ...const [CabecalhoMarca(), SizedBox(height: 48)],
              const Text('ACESSO AO SISTEMA', style: TextStyle(color: Cores.laranja, fontSize: 12, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Entrar', style: TextStyle(color: Cores.creme, fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Acesse sua conta para gerenciar a oficina.', style: TextStyle(color: Cores.cinza, fontSize: 14)),
              const SizedBox(height: 28),
              const FormularioLogin(),
            ],
          ),
        ),
      ),
    );
  }
}