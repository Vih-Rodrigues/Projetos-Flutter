import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/paises.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({ Key? key }) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  //
  // Lista dinâmica contendo objetos da classe Pais
  //
  List<Pais> lista = [];
  //
  // CARREGAR UM ARQUIVO JSON
  //
  // O método "carregarJson" carrega todo o arquivo JSON na memória, pegando somente as infos desejadas
  carregarJson() async {
    final String arquivo = await rootBundle.loadString('lib/data/paises.json');
    final dynamic data = await json.decode(arquivo);

    //percorrer o arquivo
    setState(() {
      data.forEach((item) {
        // Adiciona os dados desejados para a "lista"
        lista.add(Pais.fromJson(item)); 
      });
    });
  }

  //
  // MANIPULAR DADOS NA MEMÓRIA É MUITO MAIS RÁPIDO DO QUE MANIPULAR ARQUIVOS
  //

	//
	// Inicialização da UI e leitura do arquivo JSON
	//
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await carregarJson();
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IBGE'),
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.white24,
      //
      // EXIBIR os elementos da LISTA
      //
      body: Padding(
        padding: const EdgeInsets.all(20),
        
        child: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(lista[index].nome),
            );
          },
        ),
      ),
    );
  }
}