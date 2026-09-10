class Usuario {
  final String matricula;
  final String nome;
  final String cargo;

  const Usuario({required this.matricula, required this.nome, required this.cargo});

  String get iniciais {
    final partes = nome.trim().split(' ');
    if (partes.length >= 2) return '${partes.first[0]}${partes.last[0]}'.toUpperCase();
    return partes.isNotEmpty ? partes.first[0].toUpperCase() : '?';
  }
}