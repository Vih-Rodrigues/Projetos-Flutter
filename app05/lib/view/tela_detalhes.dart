import 'package:flutter/material.dart';

class TelaDetalhes extends StatefulWidget {
  const TelaDetalhes({ Key? key }) : super(key: key);

  @override
  State<TelaDetalhes> createState() => _TelaDetalhesState();
}

class _TelaDetalhesState extends State<TelaDetalhes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IBGE'),
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.white24,
      //
      // Floating Action Button
      //
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.favorite),
        backgroundColor: Colors.black87,
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}