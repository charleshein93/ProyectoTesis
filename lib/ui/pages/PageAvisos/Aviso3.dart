// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers, use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Aviso3 extends StatefulWidget {
  const Aviso3({super.key});

  @override
  State<Aviso3> createState() => _Aviso3State();
}

class _Aviso3State extends State<Aviso3> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _origendestinoController =
        TextEditingController();
    final TextEditingController _adultarifaController = TextEditingController();
    final TextEditingController _estutarifaController = TextEditingController();
    final TextEditingController _festitarifaController =
        TextEditingController();

    final CollectionReference _database =
        FirebaseFirestore.instance.collection('tarifa');

    Future<void> _create() async {
      await showModalBottomSheet(
        isDismissible: false,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            // reverse: true,
            // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 5,
              ),
              child: Column(
                // padding: const EdgeInsets.all(10.0),
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView(
                    shrinkWrap: true,
                    reverse: true,
                    children: <Widget>[
                      const SizedBox(height: 15),
                      const Text(
                        'Ingresar Tarifa',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Ingresa una nueva tarifa para un destino',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextField(
                        controller: _origendestinoController,
                        decoration: const InputDecoration(
                            labelText: 'Ciudad origen hacia destino'),
                      ),
                      TextField(
                        controller: _adultarifaController,
                        decoration:
                            const InputDecoration(labelText: 'Tarifa Adulto'),
                      ),
                      TextField(
                        controller: _estutarifaController,
                        decoration: const InputDecoration(
                            labelText: 'Tarifa Estudiante'),
                      ),
                      TextField(
                        controller: _festitarifaController,
                        decoration:
                            const InputDecoration(labelText: 'Tarifa Festivo'),
                      ),
                      // TextField(
                      //   controller: _festitarifaController,
                      //   decoration:
                      //       const InputDecoration(labelText: 'Tarifa Festivo'),
                      // ),
                      // TextField(
                      //   controller: _festitarifaController,
                      //   decoration:
                      //       const InputDecoration(labelText: 'Tarifa Festivo'),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Cancelar'),
                          ),
                          TextButton(
                            child: const Text('Agregar'),
                            onPressed: () async {
                              final String origendestino =
                                  _origendestinoController.text;
                              final String adultot = _adultarifaController.text;
                              final String estudiantet =
                                  _estutarifaController.text;
                              final String festivot =
                                  _festitarifaController.text;
                              await _database.add({
                                "origendestino": origendestino,
                                "adultotarifa": adultot,
                                "estudiantetarifa": estudiantet,
                                "festivotarifa": festivot,
                              });

                              _origendestinoController.text = '';
                              _adultarifaController.text = '';
                              _estutarifaController.text = '';
                              _festitarifaController.text = '';
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ].reversed.toList(),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        padding: const EdgeInsets.all(5.0));

    return ElevatedButton(
      style: style,
      onPressed: () => _create(),
      child: const Text(
        'Tarifa',
      ),
    );
  }
}
