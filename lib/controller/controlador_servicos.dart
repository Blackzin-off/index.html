import '../model/servico.dart';

class ControladorServicos {
  static final List<Servico> _lista = [
    Servico(veiculo: 'Fiat Argo', placa: 'ABC-1D23', descricao: 'Troca de óleo e filtros', detalhe: 'Aguardando disponibilidade de elevador', mecanico: 'João Paulo', status: 'Aguardando'),
    Servico(veiculo: 'Honda Civic', placa: 'XYZ-4F56', descricao: 'Diagnóstico de freios', detalhe: 'Cliente relatou ruído ao frear', mecanico: 'Diego Ramos', status: 'Aguardando', prioridade: 'Alta'),
    Servico(veiculo: 'VW Gol', placa: 'JJK-8890', descricao: 'Revisão completa 40.000km', detalhe: 'Trocando correia e velas de ignição', mecanico: 'Rafael Carvalho', status: 'Em andamento', progresso: 64, tempo: '2h 15min'),
    Servico(veiculo: 'Chevrolet Onix', placa: 'QWE-2233', descricao: 'Troca de amortecedores', detalhe: 'Suspensão traseira em substituição', mecanico: 'João Paulo', status: 'Em andamento', progresso: 30, tempo: '48min'),
    Servico(veiculo: 'Toyota Corolla', placa: 'TYC-9981', descricao: 'Reparo elétrico', detalhe: 'Bateria e alternador em teste', mecanico: 'Diego Ramos', status: 'Em andamento', prioridade: 'Alta', progresso: 50, tempo: '1h 05min'),
    Servico(veiculo: 'Ford Ka', placa: 'POI-5567', descricao: 'Alinhamento e balanceamento', detalhe: 'Serviço finalizado, veículo liberado', mecanico: 'João Paulo', status: 'Concluído', progresso: 100, tempo: '✓ 41min'),
    Servico(veiculo: 'Hyundai HB20', placa: 'ASD-9021', descricao: 'Troca de pastilhas de freio', detalhe: 'Serviço finalizado, aguardando retirada', mecanico: 'Rafael Carvalho', status: 'Concluído', progresso: 100, tempo: '✓ 1h 12min'),
  ];

  List<Servico> listarPorStatus(String status) => _lista.where((s) => s.status == status).toList();
}