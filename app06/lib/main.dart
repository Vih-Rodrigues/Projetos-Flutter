import 'dart:js';

import 'package:app06/pages/criar_conta_page.dart';
import 'package:app06/pages/inserir_page.dart';
import 'package:app06/pages/login_page.dart';
import 'package:app06/pages/principal_page.dart';
import 'package:firebase_core/firebase_core.dart'; // importação para usar Firebase
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart'; // importação para usar DefaultFirebaseOptions

Future<void> main() async {
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Café Store',
      initialRoute: 'login',
      routes: {
        'login' : (context) => const LoginPage(),
        'criar_conta' : (context) => const CriarContaPage(),
        'principal' : (context) => const PrincipalPage(),

        'inserir' : (context) => const InserirPage(),
      },
    )
  );
  
}
