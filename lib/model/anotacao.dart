class Anotacao {
  final String peca;
  final String texto;
  final String status; // URGENTE, PENDENTE, REVISADO
  final String autor;
  final String data;

  Anotacao({
    required this.peca,
    required this.texto,
    required this.status,
    required this.autor,
    required this.data,
  });
}