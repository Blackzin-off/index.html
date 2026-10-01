import 'package:flutter/material.dart';

import '../controller/controlador_pecas.dart';
import '../model/peca.dart';
import 'theme/tema_app.dart';
import 'widgets/linha_peca.dart';
import 'widgets/painel_detalhe_peca.dart';

/// Tela de Cadastro de Peças: busca na base e cadastro no estoque.
class TelaPecas extends StatefulWidget {
  const TelaPecas({super.key});
  @override
  State<TelaPecas> createState() => _TelaPecasState();
}

class _TelaPecasState extends State<TelaPecas> {
  final _controlador = ControladorPecas();
  final _busca = TextEditingController();
  String _categoria = 'Todas';
  Peca? _selecionada;
  static const _categorias = ['Todas', 'Motor', 'Freios', 'Suspensão', 'Elétrica', 'Filtros'];

  void _selecionar(Peca peca) => setState(() => _selecionada = peca);

  void _cadastrar(Peca peca) {
    setState(() => _controlador.cadastrarNoEstoque(peca));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${peca.nome} cadastrada no estoque!')));
  }

  @override
  Widget build(BuildContext context) {
    final pecas = _controlador.buscar(_busca.text, _categoria);
    final destaque = _selecionada ?? (pecas.isNotEmpty ? pecas.first : null);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _busca,
                      onChanged: (_) => setState(() {}),
                      style: const TextStyle(color: Cores.creme),
                      decoration: const InputDecoration(hintText: 'Buscar por nome, código ou fabricante...', prefixIcon: Icon(Icons.search, color: Cores.cinza)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    decoration: BoxDecoration(color: const Color(0xFF14301F), borderRadius: BorderRadius.circular(8)),
                    child: const Text('● BASE: PEÇASBR', style: TextStyle(color: Cores.verde, fontSize: 11, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 34,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categorias.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (_, i) {
                    final cat = _categorias[i];
                    final sel = cat == _categoria;
                    return ChoiceChip(
                      label: Text(cat),
                      selected: sel,
                      onSelected: (_) => setState(() => _categoria = cat),
                      backgroundColor: Cores.painel,
                      selectedColor: Cores.laranja.withOpacity(0.2),
                      labelStyle: TextStyle(color: sel ? Cores.laranjaClaro : Cores.cinza, fontSize: 12),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: pecas.isEmpty
                    ? const Center(child: Text('Nenhuma peça encontrada.', style: TextStyle(color: Cores.cinza)))
                    : ListView.builder(
                        itemCount: pecas.length,
                        itemBuilder: (_, i) => LinhaPeca(peca: pecas[i], selecionada: pecas[i] == destaque, onTocar: () => _selecionar(pecas[i]), onAdicionar: () => _cadastrar(pecas[i])),
                      ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(width: 320, child: destaque == null ? const SizedBox() : PainelDetalhePeca(peca: destaque, onCadastrar: () => _cadastrar(destaque))),
      ],
    );
  }
}
