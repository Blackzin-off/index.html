import '../model/servico.dart';

class ControladorServicos {
  static final List<Servico> _lista = [
    Servico(veiculo: 'Fiat Argo', placa: 'ABC-1D23', descricao: 'Troca de óleo e filtros', mecanico: 'João Paulo', status: 'Aguardando'),
    Servico(veiculo: 'Honda Civic', placa: 'XYZ-4F56', descricao: 'Diagnóstico de freios', mecanico: 'Diego Ramos', status: 'Aguardando', prioridade: 'Alta'),
    Servico(veiculo: 'VW Gol', placa: 'JJK-8890', descricao: 'Revisão completa 40.000km', mecanico: 'Rafael Carvalho', status: 'Em andamento', progresso: 64, tempo: '2h 15min'),
    Servico(veiculo: 'Chevrolet Onix', placa: 'QWE-2233', descricao: 'Troca de amortecedores', mecanico: 'João Paulo', status: 'Em andamento', progresso: 30, tempo: '48min'),
    Servico(veiculo: 'Ford Ka', placa: 'POI-5567', descricao: 'Alinhamento e balanceamento', mecanico: 'João Paulo', status: 'Concluído', progresso: 100, tempo: '✓ 41min'),
  ];

  List<Servico> listarPorStatus(String status) => _lista.where((s) => s.status == status).toList();
}