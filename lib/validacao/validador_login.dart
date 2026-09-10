class ValidadorLogin {
  ValidadorLogin._();

  static String? validarUsuario(String? valor) {
    if (valor == null || valor.trim().isEmpty) return 'Informe o usuário';
    return null;
  }

  static String? validarSenha(String? valor) {
    if (valor == null || valor.isEmpty) return 'Informe a senha';
    return null;
  }
}