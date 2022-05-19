import 'package:app06/pages/widgets/mensagem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {

  //
  // Referenciar/Indicar a coleção de cafés 
  //
  var cafes;

  @override
  //
  // Método initState indica que assim que o app é aberto, a conexão com o firestore já é feita
  //
  void initState(){
    super.initState();
    cafes = FirebaseFirestore.instance.collection('cafes');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Café Store'),
        centerTitle: true,
        backgroundColor: Colors.brown,
        automaticallyImplyLeading: false,
        actions: [
          Column(
            children: [
              IconButton(
                tooltip: 'sair',
                onPressed: () {

                  //
                  // TRECHO QUE FAZ O LOGOUT
                  //
                  FirebaseAuth.instance.signOut();
                  
                  Navigator.pushReplacementNamed(context, 'login');
                },
                icon: const Icon(Icons.logout),
              ),
              Text(
                
                //
                // TRECHO QUE MOSTRA QUAL USUÁRIO ESTÁ LOGADO ATRAVÉS DO EMAIL
                //
                FirebaseAuth.instance.currentUser!.email.toString(),
                
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      backgroundColor: Colors.brown[50],
      body: Container(
        padding: const EdgeInsets.all(50),

        //
        // EXIBIR OS DOCUMENTOS DA COLEÇÃO DO FIRESTORE
        //
        child: StreamBuilder<QuerySnapshot>(
          //
          // Fonte de dados
          //
          stream: cafes.snapshots(),
          builder: (context,snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.none:
                return const Center(child: Text('Não foi possível conectar.'));
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                final dados = snapshot.requireData;
                return ListView.builder(
                  itemCount: dados.size,
                  itemBuilder: (context,index){
                    return exibirDocumento(dados.docs[index]);
                  },
                );
            }

          },
        ),

      ),

      //
      // Botão
      //
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.brown,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'inserir');
        },
      ),

    );
  }

  //
  // Método
  //
  exibirDocumento(item){

    String nome = item.data()['nome'];
    String preco = item.data()['preco'];

    return ListTile(
      title: Text(nome),
      subtitle: Text(preco),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        onPressed: (){
          cafes.doc(item.id).delete();
          sucesso(context, 'O documento foi apagado com sucesso.');
        },
      ),

      onTap: (){
        Navigator.pushNamed(
          context, 
          'inserir', 
          arguments: item.id,
        );
      },

    );

  }
}