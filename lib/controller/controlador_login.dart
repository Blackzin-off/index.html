import '../model/usuario.dart';

class ControladorLogin {
  static const _usuarioCadastrado = 'OF-00231';
  static const _senhaCadastrada = 'senha123';
  static const _usuarioLogado = Usuario(
    matricula: 'OF-00231',
    nome: 'Rafael Carvalho',
    cargo: 'Mecânico Chefe',
    email: 'rafael.carvalho@avantgarde.com',
    telefone: '(11) 98221-4470',
    desde: 'Março de 2021',
  );

  Usuario? autenticar(String usuario, String senha) {
    if (usuario.trim() == _usuarioCadastrado && senha == _senhaCadastrada) {
      return _usuarioLogado;
    }
    return null;
  }
}