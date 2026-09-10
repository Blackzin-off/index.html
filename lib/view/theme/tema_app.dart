import 'package:flutter/material.dart';

class Cores {
  Cores._();
  static const fundo = Color(0xFF0A0908);
  static const painel = Color(0xFF100D0B);
  static const borda = Color(0xFF241E16);
  static const laranja = Color(0xFFFF5A1F);
  static const laranjaClaro = Color(0xFFFF7A3D);
  static const creme = Color(0xFFF4EFE6);
  static const cinza = Color(0xFF8C8375);
  static const vermelho = Color(0xFFE14A3B);
  static const verde = Color(0xFF59C27C);
}

class Tema {
  Tema._();

  static ThemeData get escuro {
    final borda = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Cores.borda),
    );
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Cores.fundo,
      colorScheme: const ColorScheme.dark(primary: Cores.laranja, surface: Cores.painel, error: Cores.vermelho),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Cores.painel,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        enabledBorder: borda,
        focusedBorder: borda.copyWith(borderSide: const BorderSide(color: Cores.laranja, width: 1.5)),
        hintStyle: const TextStyle(color: Cores.cinza),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Cores.laranja,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}