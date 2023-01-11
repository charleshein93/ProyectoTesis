// ignore_for_file: file_names
import 'package:flutter/material.dart';

class Aviso1 extends StatefulWidget {
  const Aviso1({super.key});

  @override
  State<Aviso1> createState() => _Aviso1State();
}

class _Aviso1State extends State<Aviso1> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        padding: const EdgeInsets.all(16.0));
    return ElevatedButton(
      style: style,
      child: const Text('Ingresar Alerta'),
      onPressed: () => showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
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
                const TextField(
                  decoration: InputDecoration(labelText: 'Descripción alerta'),
                ),
                const TextField(
                  decoration: InputDecoration(labelText: 'Tipo de alerta'),
                ),
                const TextField(
                  decoration: InputDecoration(labelText: 'Hora'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Agregar'),
                    ),
                  ],
                ),
              ].reversed.toList(),
            ),
          ),
        ),
      ),
    );
  }
}
