// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Aviso2 extends StatefulWidget {
  const Aviso2({super.key});

  @override
  State<Aviso2> createState() => _Aviso2State();
}

class _Aviso2State extends State<Aviso2> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _recorridoController = TextEditingController();
    final TextEditingController _salidaController = TextEditingController();
    final TextEditingController _hsalidaController = TextEditingController();

    final CollectionReference _database =
        FirebaseFirestore.instance.collection('horario');

    Future<void> _create() async {
      await showModalBottomSheet(
        isDismissible: false,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            // padding: const EdgeInsets.all(10.0),
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom + 5,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              verticalDirection: VerticalDirection.up,
              children: [
                ListView(
                  shrinkWrap: true,
                  reverse: true,
                  children: <Widget>[
                    const SizedBox(height: 15),
                    const Text(
                      'Ingresar Horario',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Ingresa un nuevo horaio',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    TextField(
                      controller: _recorridoController,
                      decoration: const InputDecoration(labelText: 'Recorrido'),
                    ),
                    TextField(
                      controller: _salidaController,
                      decoration:
                          const InputDecoration(labelText: 'Ciudad Salida'),
                    ),
                    TextField(
                      controller: _hsalidaController,
                      decoration:
                          const InputDecoration(labelText: 'Hora Salida'),
                    ),
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
                            final String horarioRecorrido =
                                _recorridoController.text;
                            final String horarioSalida = _salidaController.text;
                            final String horarioHoraSalida =
                                _hsalidaController.text;
                            await _database.add({
                              "recorrido": horarioRecorrido,
                              "salida": horarioSalida,
                              "horasalida": horarioHoraSalida,
                            });

                            _recorridoController.text = '';
                            _salidaController.text = '';
                            _hsalidaController.text = '';
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ].reversed.toList(),
                ),
              ],
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
        'Horario',
      ),
    );
  }
}
