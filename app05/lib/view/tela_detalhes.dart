import 'package:flutter/material.dart';
import '../model/paises.dart';

class TelaDetalhes extends StatefulWidget {
  const TelaDetalhes({ Key? key }) : super(key: key);

  @override
  State<TelaDetalhes> createState() => _TelaDetalhesState();
}

class _TelaDetalhesState extends State<TelaDetalhes> {
  @override
  Widget build(BuildContext context) {

    //
    // RECUPERAR OS DADOS PASSADOS COMO ARGUMENTO
    //
    final Pais p = 
      ModalRoute.of(context)!.settings.arguments as Pais;

    return Scaffold(
      appBar: AppBar(
        title: const Text('IBGE'),
        backgroundColor: Colors.black87,
        
        leading: IconButton(
          tooltip: 'voltar',
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      //
      // BODY
      //
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Image.network(
              'https://countryflagsapi.com/png/' +
              p.abreviatura.toLowerCase(),
            ),
            Text(p.nome, style: const TextStyle(fontSize: 28)),
            Text(p.historico, style: const TextStyle(fontSize: 20))
          ],
        ),
      ),

      backgroundColor: Colors.white24,
      //
      // Floating Action Button
      //
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.favorite),
        backgroundColor: Colors.black87,
        onPressed: (){

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'O ${p.nome.toUpperCase()} foi adicionado aos favoritos.',
              ),
              duration: const Duration(seconds: 3),
            ),
          );

          Navigator.pop(context);
        },
      ),
    );
  }
}