/// Programação para Dispositivos Móveis - Aula 09/03/2022

import 'package:flutter/material.dart';
import 'package:app03/widget_carro.dart'; // -> Importa a classe widget_carro

// ---> Função principal
void main() {
  
  // Iniciar a execução do App:
  runApp(
    // 'const' indica que o tipo de aplicativo não sofrerá alterações + 'MaterialApp' é utilizado para os padrões de design
    const MaterialApp(
      // 'debugShowCheckedModeBanner: false' remove o ícone "debug" do App
      debugShowCheckedModeBanner: false,
      title: 'webCars',

      // Indicar qual é a tela inicial:
      home: TelaPrincipal(),

    )
  );
}

// --------------------------------------------------
// ---> Tela principal
class TelaPrincipal extends StatelessWidget {
  
  // ---> Construtor da TelaPrincipal
  const TelaPrincipal({ Key? key }) : super(key: key);

  // Método 'build' = responsável por construir todos os elementos visuais (widgets) que aparecerão na interface gráfica (UI)
  @override
  Widget build(BuildContext context) {
    
    // Scaffold ocupa toda a tela do dispositivo
    return Scaffold(

      // BARRA DE TÍTULO
      appBar: AppBar(
        title: const Text('WebCars'),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
      ),
        
      // BODY
      // SingleChildScrollView é a função que permite a barra de rolagem na vertical
      body: SingleChildScrollView(
        // Column indica que a organização da tela se dará por colunas
        child: Column(
          // 'crossAxisAlignment: CrossAxisAlignment.center' centraliza o que virá em 'children'
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const[
            WidgetCarro("Audi", "Q8", "lib/imagens/audi_q8.jpg"),
            WidgetCarro("Audi", "R8", "lib/imagens/audi_r8.jpg"),
            WidgetCarro("BMW", "M2", "lib/imagens/bmw_m2.jpg"),
            WidgetCarro("Ferrari", "488", "lib/imagens/ferrari_488.jpg"),
            WidgetCarro("Lamborghini", "Huracan", "lib/imagens/lamborghini_huracan.jpg"),
            WidgetCarro("Lamborghini", "Urus", "lib/imagens/lamborghini_urus.jpg"),
            WidgetCarro("Masserati", "GTS", "lib/imagens/maserati_gts.jpg"),
          ],
      
          /* 'mainAxisAlignment: MainAxisAlignment.center' = a organização dos objetos da página devem estar no meio
          mainAxisAlignment: MainAxisAlignment.center,
          */
          
        ),
      ),
    
    );
  
  }
}