class Servico {
  final String veiculo;
  final String placa;
  final String descricao;
  final String detalhe;
  final String mecanico;
  final String status; // Aguardando, Em andamento, Concluído
  final String prioridade;
  final int progresso;
  final String tempo;

  Servico({
    required this.veiculo,
    required this.placa,
    required this.descricao,
    required this.detalhe,
    required this.mecanico,
    required this.status,
    this.prioridade = 'Normal',
    this.progresso = 0,
    this.tempo = '',
  });
}