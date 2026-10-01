import '../model/anotacao.dart';

class ControladorAnotacoes {
  static final List<Anotacao> _lista = [
    Anotacao(peca: 'Pastilha de Freio Dianteira', texto: 'Embalagem chegou danificada. Confirmar com o fabricante.', status: 'URGENTE', autor: 'Rafael Carvalho', data: 'hoje'),
    Anotacao(peca: 'Amortecedor Traseiro', texto: 'Verificar se o código bate com o modelo do veículo.', status: 'PENDENTE', autor: 'Juliana Prado', data: 'ontem'),
    Anotacao(peca: 'Bateria 60Ah Selada', texto: 'Dados conferidos. Pronta para cadastro definitivo.', status: 'REVISADO', autor: 'Diego Ramos', data: 'ontem'),
  ];

  List<Anotacao> listar() => _lista.reversed.toList();

  void adicionar(Anotacao anotacao) => _lista.add(anotacao);
}