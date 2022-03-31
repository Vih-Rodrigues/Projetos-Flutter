import 'dart:js';

import 'package:app05/view/tela_detalhes.dart';
import 'package:app05/view/tela_principal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IBGE',
      initialRoute: 'tela1',
      routes: {
        'tela1' : (context) => const TelaPrincipal(),
        'tela2' : (context) => const TelaDetalhes(),
      },
    ),
  );
}