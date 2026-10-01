class Peca {
  final String codigo;
  final String nome;
  final String categoria;
  final String fabricante;
  final double precoVenda;
  bool origemBase;

  Peca({
    required this.codigo,
    required this.nome,
    required this.categoria,
    required this.fabricante,
    required this.precoVenda,
    this.origemBase = true,
  });
}