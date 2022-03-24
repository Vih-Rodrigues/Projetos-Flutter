// Programação para Dispositivos Móveis - Aula 03/03/2022

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

      // Indica qual é a tela inicial:
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
        
        // appBar define uma barra de ferramentas na aplicação
        appBar: AppBar(

          // Como mudar cor do texto? backgroundColor: Colors.black,
          title: const Text('Texto'),
          backgroundColor: Colors.purple.shade400,
          actions: [
            IconButton(
              color: Colors.black,
              onPressed: () {}, 
              icon: const Icon(Icons.home)
            )
          ],
        ),

        // Definindo as divisões do corpo da página
        body: Column(children: [
          Row(
            children: [
              
              // 1º Container na metade da primeira linha
              Container(
                // Largura:
                width: MediaQuery.of(context).size.width*0.50,
                // Altura:
                height: MediaQuery.of(context).size.width*0.20,
                color: Colors.blue.shade400,
                child: const Center(child: Text("A"),),
              ),
              
              // 2º Container na outra metade da primeira linha
              Container(
                // Largura:
                width: MediaQuery.of(context).size.width*0.50,
                // Altura:
                height: MediaQuery.of(context).size.width*0.20,
                color: Colors.yellow.shade400,
                child: const Center(child: Text("A"),),
              )
            ],
          ),

          // PAREI AQUI Ó

          Row(
            // 2º Container 
            children: [
              Container(
                // Largura:
                width: MediaQuery.of(context).size.width*0.50,
                // Altura:
                height: MediaQuery.of(context).size.width*0.50,
                color: Colors.blue.shade900,
                child: const Center(child: Text("B"),),
              )
            ],
          ),

          Row(
            // 3º Container 
            children: [
              Container(
                // Largura:
                width: MediaQuery.of(context).size.width*0.50,
                // Altura:
                height: MediaQuery.of(context).size.width*0.50,
                color: Colors.blue.shade900,
                child: const Center(child: Text("C"),),
              )
            ],
          ),
        ]),
          
        /*
          // 'mainAxisAlignment: MainAxisAlignment.center' = a organização dos objetos da página devem estar no meio
          mainAxisAlignment: MainAxisAlignment.center,
          
          children:
            // 'Center' irá centralizar o texto que encontra-se em 'child'
            ( 
              child: Text('Texto'),
            ),

            // children = indica "filhos" (ou telas), isto é, é possível ter várias
          children: [
            Text(
              Icons.computer, size: 60,
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
        */
    
    );
  
  }
}