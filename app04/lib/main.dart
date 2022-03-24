// Programação para Dispositivos Móveis - Aulas 16 e 17/03

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math'; // Biblioteca importada para uso do "pow" quando se recupera os dados informados pelo usuário

// ---> Função principal
void main() {
  
  // Iniciar a execução do App:
  runApp(
    // 'const' indica que o tipo de aplicativo não sofrerá alterações + 'MaterialApp' é utilizado para os padrões de design
    const MaterialApp(
      // 'debugShowCheckedModeBanner: false' remove o ícone "debug" do App
      debugShowCheckedModeBanner: false,
      title: 'IMC',

      // Indicar qual é a tela inicial:
      home: TelaPrincipal(),
    )
  );
}

// 
// TELA PRINCIPAL
//
// Stateful = stf + Tab
class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({ Key? key }) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  
  // Declaração de atributos que serão utilizados para receber os dados que o usuário digitar no campo de texto
  var txtPeso = TextEditingController();
  var txtAltura = TextEditingController();

  // Declaração do atributo que identifica unicamente o formulário
  var f1 = GlobalKey<FormState>();

  // !!!!!!!!!!!!!!!!!!!!!!
  // Método initState = bloco que se deseja escrever dentro da pagina
  @override
  void initState() { // quando a tela for carregada...
    //txtPeso.text = '123456'; // a variavel txtPeso recebe 123456
    super.initState(); // chama o initState, e o readonly que deve estar setado como true 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // BARRA TÍTULO
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 140, 0, 255),
      ),

      backgroundColor: Colors.grey.shade100,

      // BODY
      body: SingleChildScrollView(
      
          child: Center(
            child: Padding(
              
              padding: const EdgeInsets.all(30.0),

              child: Form(
                
                // Identificador do form
                key: f1,
                
                child: Column(
                  children: [
                    const Icon(
                      Icons.people_alt, 
                      size: 100,
                      color: Color.fromARGB(255, 119, 0, 255)
                    ),

                    campoTexto('Peso', txtPeso),
                    const SizedBox(
                      height: 20,
                    ),
                    
                    campoTexto('Altura', txtAltura), 
                    const SizedBox(
                      height: 30,
                    ),

                    botao('Calcular'),
                  ],
                ),
              
              ),
              
            ),
          ),
      ),
    );
  }

  //
  // CAMPO DE TEXTO
  //
  campoTexto(rotulo, variavel){

    return TextFormField(
      // Associar a variável que receberá o valor digitado no campo de texto
      controller: variavel,

      // Habilitar o teclado numérico
      keyboardType: TextInputType.number,
      
      // Campo de senha escondida
      obscureText: false,

      // Número de caracteres
      maxLength: 10,
      
      // !!!!!!!!!!!!!!!!!!!!!!!!!
      // Definir o campo de texto como somente leitura
      readOnly: false,

      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: const TextStyle(
          fontSize: 22,
          color: Color.fromARGB(126, 82, 82, 82)     
        ),

        hintText: 'Informe o valor',
        hintStyle: const TextStyle(
          fontSize: 22,
          color: Color.fromARGB(126, 82, 82, 82),
        ),       
        
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),

      ),

      // 
      // VALIDAÇÃO DOS DADOS
      //
      validator: (value){
        value = value!.replaceFirst(',', '.');
        if (double.tryParse(value)==null){
          return 'Entre com um valor numérico.';
        }
      },

    );
  }

  //
  // BOTÃO
  // 
  botao(rotulo){
    return SizedBox(
      width: 200,
      height: 50,
      
      child: ElevatedButton(
        
        // Evento que ocorrerá quando o usuário acionar o botão
        onPressed: () {
          
          // Valida a variável f1, informando com ! que a mesma pode não ter sido instanciada e ok 
          if (f1.currentState!.validate()){

            //Recuperar os dados informados pelo usuário
            setState(() {
              
              double p = double.parse(txtPeso.text.replaceFirst(',', '.'));
              double a = double.parse(txtAltura.text.replaceFirst(',', '.'));
              double i = p/pow(a,2);

              // CHAMADA DA CAIXA DE DIALOGO
              caixaDialogo('O valor do IMC é ${i.toStringAsFixed(2).replaceFirst(',', '.')}');

            });

          }

        },

        child: Text(
            rotulo,
            style: const TextStyle(fontSize: 22),
        ),
        
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 119, 0, 255),
        ),
      
      ),
      
    );
  }

  //
  // CAIXA DE DIALOGO
  //
  caixaDialogo(msg){

    return showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          content: Text(msg),
          actions: [
            TextButton(
              onPressed: (){ 
                Navigator.of(context).pop(); // pop faz a caixa de dialogo ser fechada
              },
              child: const Text('Fechar')
            ),
          ],
        );
      }
    );
  }

}
