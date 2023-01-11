//borrar
// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers, use_build_context_synchronously, await_only_futures
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Aviso1 extends StatefulWidget {
  const Aviso1({super.key});

  @override
  State<Aviso1> createState() => _Aviso1State();
}

class _Aviso1State extends State<Aviso1> {
  // final _formKey = GlobalKey<FormState>();
  var tipoAlerta = [
    'Atraso de bus',
    'Accidente',
    'Trafico',
    'Demora llegar destino',
  ];
  // String _vista = 'Seleccione el tipo de ALERTA';

  final TextEditingController _alertaController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();

  final CollectionReference _database =
      FirebaseFirestore.instance.collection('alerta');

  Future<void> _create() async {
    await showBottomSheet(
      context: context,
      builder: (BuildContext ctx) {
        return Padding(
          // padding: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            shrinkWrap: true,
            reverse: true,
            children: <Widget>[
              const SizedBox(height: 15),
              const Text(
                'Ingresar Alerta',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Ingresa una alerta para avisar sobre un accidente, retraso u otro motivo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              //CAMPOS PARA RELLENAR

              // DropdownButtonFormField(
              //   controller: _alertaController,
              //   hint: Text(_vista),
              //   items: tipoAlerta.map((String item) {
              //     return DropdownMenuItem(
              //       value: item,
              //       child: Text(item),
              //     );
              //   }).toList(),
              //   onChanged: (_val) => setState(() {
              //     _vista = _val as String;
              //   }),
              // ),
              TextField(
                controller: _alertaController,
                decoration: const InputDecoration(labelText: 'Tipo de alerta'),
              ),

              TextField(
                controller: _descripcionController,
                decoration:
                    const InputDecoration(labelText: 'Descripción alerta'),
              ),
              const Text(
                'Registro',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateFormat('yyyy-MM-dd kk:mm:ss').format(DateTime.now()),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
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
                      final String alertaTipo = _alertaController.text;
                      final String alertaDescripcion =
                          _descripcionController.text;
                      await _database.add({
                        "tipoalerta": alertaTipo,
                        "descrialerta": alertaDescripcion,
                      });

                      _alertaController.text = '';
                      _descripcionController.text = '';
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ].reversed.toList(),
          ),
        );
      },
    );
  }

//   @override
//   Widget build(BuildContext context) {
  // final ButtonStyle style = ElevatedButton.styleFrom(
  //     textStyle: const TextStyle(fontSize: 20),
  //     padding: const EdgeInsets.all(16.0));
//     return IconButton(
  // style: style,
//       icon: const Icon(Icons.radar),
//       color: Colors.green,
//       iconSize: 50,
//       onPressed: () => _create(),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        padding: const EdgeInsets.all(16.0));
    return ElevatedButton(
      style: style,
      onPressed: () => _create(),
      child: const Text(
        'Ingresar Alerta',
      ),
    );
  }
}
