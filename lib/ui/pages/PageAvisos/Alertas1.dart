// ignore_for_file: use_build_context_synchronously, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Alerta1 extends StatefulWidget {
  const Alerta1({super.key});

  @override
  State<Alerta1> createState() => _Alerta1State();
}

class _Alerta1State extends State<Alerta1> {
  final TextEditingController _alertaController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();

  final CollectionReference _database =
      FirebaseFirestore.instance.collection('alerta');

//borrar
  Future<void> _delete(String productId) async {
    await _database.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Se ha borrado completamente'),
      ),
    );
  }

  //actualizar
  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _alertaController.text = documentSnapshot['tipoalerta'];
      _descripcionController.text = documentSnapshot['descrialerta']();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _alertaController,
                  decoration: const InputDecoration(labelText: 'Tipo Alerta'),
                ),
                TextField(
                  controller: _descripcionController,
                  decoration:
                      const InputDecoration(labelText: 'Descripcion alerta'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('ACTUALIZAR'),
                  onPressed: () async {
                    final String tipoalerta = _alertaController.text;
                    final String descrialerta = _descripcionController.text;

                    await _database.doc(documentSnapshot!.id).update({
                      "tipoalerta": tipoalerta,
                      "descrialerta": descrialerta
                    });
                    _alertaController.text = '';
                    _descripcionController.text = '';
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _database.snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.active) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(documentSnapshot['tipoalerta']),
                    subtitle: Text(documentSnapshot['descrialerta']),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          //boton editar
                          IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => _update(documentSnapshot)),
                          //boton borrar
                          IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _delete(documentSnapshot.id)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
