import 'package:flutter/material.dart';

import '../controller/controlador_anotacoes.dart';
import 'theme/tema_app.dart';
import 'widgets/cartao_anotacao.dart';
import 'widgets/formulario_anotacao.dart';

/// Tela de Anotações sobre peças, com formulário fixo ao lado da lista.
class TelaAnotacoes extends StatefulWidget {
  const TelaAnotacoes({super.key});
  @override
  State<TelaAnotacoes> createState() => _TelaAnotacoesState();
}

class _TelaAnotacoesState extends State<TelaAnotacoes> {
  final _controlador = ControladorAnotacoes();

  @override
  Widget build(BuildContext context) {
    final anotacoes = _controlador.listar();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: ListView.builder(
            itemCount: anotacoes.length,
            itemBuilder: (_, i) => CartaoAnotacao(anotacao: anotacoes[i]),
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(
          width: 340,
          child: FormularioAnotacao(onSalvar: (a) => setState(() => _controlador.adicionar(a))),
        ),
      ],
    );
  }
}
