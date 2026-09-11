import '../model/usuario.dart';

class ControladorLogin {
  static const _usuarioCadastrado = 'erizin';
  static const _senhaCadastrada = 'da.10.ai.tia';
  static const _usuarioLogado = Usuario(
    matricula: 'OF-00231',
    nome: 'Rei-Delas',
    cargo: 'Um cara muito importante',
  );

  Usuario? autenticar(String usuario, String senha) {
    if (usuario.trim() == _usuarioCadastrado && senha == _senhaCadastrada) {
      return _usuarioLogado;
    }
    return null;
  }
}