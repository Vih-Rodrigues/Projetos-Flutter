// Programação para Dispositivos Móveis - Aulas 23 e 24/02

import 'package:flutter/material.dart';

// ---> Função principal
void main() {
  
  // Iniciar a execução do App:
  runApp(
    // 'const' indica que o tipo de aplicativo não sofrerá alterações + 'MaterialApp' é utilizado para os padrões de design
    const MaterialApp(
      // 'debugShowCheckedModeBanner: false' remove o ícone "debug" do App
      debugShowCheckedModeBanner: false,
      title: 'Meu primeiro App',

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
        
        // Column indica que a organização da tela se dará por colunas
        body: Column(
          
          // 'mainAxisAlignment: MainAxisAlignment.center' = a organização dos objetos da página devem estar no meio
          mainAxisAlignment: MainAxisAlignment.center,
          
          // children = indica "filhos" (ou telas), isto é, é possível ter várias
          children: [
            Icon(
              Icons.computer, size: 60,
            ),
            
            // 'Center' irá centralizar o texto que encontra-se em 'child'
            Center( 
              child: Text('Hello World!'),
            ),

            Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),

                Container(
                  width: 100,
                  height: 100,
                  color: Colors.purple,
                ),

                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),

                Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                ),

                Container(
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                ),

                Container(
                  width: 100,
                  height: 100,
                  color: Colors.orange,
                ),
              ],
            ),
          
            Icon(
              Icons.alarm_off, size: 60,
            ),

            Icon(
              Icons.add_to_drive, size: 60,
            ),

            Icon(
              Icons.add_business_sharp, size: 120,
            ),

            Center(
              child: Text('Fim da página :D...'),
            )

          ],
        ),
    
    );
  
  }
}