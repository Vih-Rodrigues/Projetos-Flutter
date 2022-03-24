import 'package:flutter/material.dart';

class WidgetCarro extends StatelessWidget {

  // ATRIBUTOS PARA RECEBER DADOS DE OUTRA CLASSE
  final String marca;
  final String modelo;
  final String imagem;

  // CONSTRUTOR
  const WidgetCarro(this.marca, this.modelo, this.imagem, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // 'margin' pega todas as bordas da imagem e adiciona 20 de margem, delimitando um espaço entre texto e imagem, etc
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        width: 500,
        height: 300,
        //color: Colors.red.shade100,

        // Definir bordas para o container
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade900,
            width: 2, // -> espessura
          ),
          borderRadius: BorderRadius.circular(12), // -> faz os cantos do container arredondados
          color: Colors.grey.shade300,
        ),

        child: Column(
          children: [
            
            Text(
              marca, // Atributo
              style: const TextStyle(
                fontSize: 20,
                color: Colors.red,
                // 'fontWeight: FontWeight.bold' = espessura da fonte
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            
            Text(
              modelo,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),

            Image.asset(
              imagem,
              scale: 1.8,
              fit: BoxFit.fitWidth,
            )
          ],
        )
      ),
    );
  }
}