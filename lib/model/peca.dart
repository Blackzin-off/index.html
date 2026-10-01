class Peca {
  final String codigo;
  final String nome;
  final String categoria;
  final String fabricante;
  final double precoVenda;
  final double precoCusto;
  final int quantidadeEstoque;
  final int estoqueMinimo;
  bool origemBase;

  Peca({
    required this.codigo,
    required this.nome,
    required this.categoria,
    required this.fabricante,
    required this.precoVenda,
    required this.precoCusto,
    this.quantidadeEstoque = 0,
    this.estoqueMinimo = 5,
    this.origemBase = true,
  });
}