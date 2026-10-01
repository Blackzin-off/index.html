import '../model/peca.dart';

class ControladorPecas {
  static final List<Peca> _base = [
    Peca(codigo: 'PC-1042', nome: 'Pastilha de Freio Dianteira', categoria: 'Freios', fabricante: 'Bosch', precoVenda: 129.90, precoCusto: 89.00, quantidadeEstoque: 14),
    Peca(codigo: 'PC-2210', nome: 'Filtro de Óleo Blindado', categoria: 'Filtros', fabricante: 'Mann Filter', precoVenda: 38.50, precoCusto: 24.00, quantidadeEstoque: 30),
    Peca(codigo: 'PC-3387', nome: 'Correia Dentada Kit', categoria: 'Motor', fabricante: 'Gates', precoVenda: 214.00, precoCusto: 150.00, quantidadeEstoque: 8),
    Peca(codigo: 'PC-4108', nome: 'Amortecedor Traseiro', categoria: 'Suspensão', fabricante: 'Monroe', precoVenda: 356.90, precoCusto: 260.00, quantidadeEstoque: 6),
    Peca(codigo: 'PC-5521', nome: 'Vela de Ignição Iridium', categoria: 'Motor', fabricante: 'NGK', precoVenda: 42.90, precoCusto: 28.00, quantidadeEstoque: 40),
    Peca(codigo: 'PC-6650', nome: 'Bateria 60Ah Selada', categoria: 'Elétrica', fabricante: 'Moura', precoVenda: 489.00, precoCusto: 370.00, quantidadeEstoque: 5),
  ];

  List<Peca> buscar(String termo, String categoria) {
    return _base.where((p) {
      final bateTermo = termo.isEmpty ||
          p.nome.toLowerCase().contains(termo.toLowerCase()) ||
          p.codigo.toLowerCase().contains(termo.toLowerCase());
      final bateCategoria = categoria == 'Todas' || p.categoria == categoria;
      return bateTermo && bateCategoria;
    }).toList();
  }

  void cadastrarNoEstoque(Peca peca) => peca.origemBase = false;
}