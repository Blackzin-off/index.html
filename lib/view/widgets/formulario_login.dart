import 'package:flutter/material.dart';
import '../../controller/controlador_login.dart';
import '../tela_dashboard.dart';
import '../theme/tema_app.dart';

class FormularioLogin extends StatefulWidget {
  const FormularioLogin({super.key});

  @override
  State<FormularioLogin> createState() => _FormularioLoginState();
}

class _FormularioLoginState extends State<FormularioLogin> {
  final _controlador = ControladorLogin();
  final _usuario = TextEditingController();
  final _senha = TextEditingController();

  void _entrar() {
    final usuario = _controlador.autenticar(_usuario.text, _senha.text);
    if (usuario != null) {
      Navigator.of(context).push(MaterialPageRoute(builder:
          (_) => TelaDashboard(usuario: usuario)));
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: Cores.painel,
          title: const Text('Não foi possível acessar',
              style: TextStyle(color: Cores.creme)),
          content: const Text('Usuário ou senha incorretos.',
              style: TextStyle(color: Cores.cinza)),
          actions: [TextButton(onPressed: () => Navigator.pop(context),
              child: const Text('OK'))],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('USUÁRIO', style: TextStyle(color: Cores.cinza, fontSize: 11)),
        const SizedBox(height: 8),
        TextField(controller: _usuario, decoration:
        const InputDecoration(hintText: 'sua matrícula')),
        const SizedBox(height: 20),
        const Text('SENHA', style: TextStyle(color: Cores.cinza, fontSize: 11)),
        const SizedBox(height: 8),
        TextField(controller: _senha, obscureText: true, decoration:
        const InputDecoration(hintText: '••••••••••')),
        const SizedBox(height: 28),
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: _entrar,
            child: const Text('ENTRAR'))),
      ],
    );
  }
}