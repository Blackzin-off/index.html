import '../model/usuario.dart';

class ControladorLogin {
  static const _usuarioCadastrado = 'erizin';
  static const _senhaCadastrada = 'da.10.tia';
  static const _usuarioLogado = Usuario(
    matricula: 'OF-00231',
    nome: 'Erivaldo Sousa',
    cargo: 'Um cara importante ai',
    email: 'eri.sousa@avantgarde.com',
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