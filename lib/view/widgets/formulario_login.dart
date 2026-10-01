import 'package:flutter/material.dart';

import '../../controller/controlador_login.dart';
import '../../validacao/validador_login.dart';
import '../tela_principal.dart';
import '../theme/tema_app.dart';

class FormularioLogin extends StatefulWidget {
  const FormularioLogin({super.key});
  @override
  State<FormularioLogin> createState() => _FormularioLoginState();
}

class _FormularioLoginState extends State<FormularioLogin> {
  final _chave = GlobalKey<FormState>();
  final _controlador = ControladorLogin();
  final _usuario = TextEditingController();
  final _senha = TextEditingController();

  void _entrar() {
    if (!_chave.currentState!.validate()) return;
    final usuario = _controlador.autenticar(_usuario.text, _senha.text);
    if (usuario != null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => TelaPrincipal(usuario: usuario)));
      return;
    }
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Cores.painel,
        title: const Text('Não foi possível acessar'),
        content: const Text('Usuário ou senha incorretos.'),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _chave,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('USUÁRIO', style: TextStyle(color: Cores.cinza, fontSize: 11)),
          const SizedBox(height: 8),
          TextFormField(controller: _usuario, validator: ValidadorLogin.validarUsuario, decoration: const InputDecoration(hintText: 'sua matrícula')),
          const SizedBox(height: 20),
          const Text('SENHA', style: TextStyle(color: Cores.cinza, fontSize: 11)),
          const SizedBox(height: 8),
          TextFormField(controller: _senha, obscureText: true, validator: ValidadorLogin.validarSenha, decoration: const InputDecoration(hintText: '••••••••••')),
          const SizedBox(height: 28),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: _entrar, child: const Text('ENTRAR'))),
        ],
      ),
    );
  }
}