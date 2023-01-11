// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Aviso2 extends StatefulWidget {
  const Aviso2({super.key});

  @override
  State<Aviso2> createState() => _Aviso2State();
}

class _Aviso2State extends State<Aviso2> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        padding: const EdgeInsets.all(5.0));
    return ElevatedButton(
      style: style,
      child: const Text('Horario'),
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
                  'Ingresar nuevo Horario',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Ingresa un nuevo horario',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(labelText: 'Horario bus-empresa'),
                ),
                const TextField(
                  decoration: InputDecoration(labelText: 'Recorrido'),
                ),
                const TextField(
                  decoration: InputDecoration(labelText: 'Inicio recorrido'),
                ),
                const TextField(
                  decoration: InputDecoration(labelText: 'Hora salida'),
                ),
                const TextField(
                  decoration: InputDecoration(labelText: 'Taria estudiante'),
                ),
                const TextField(
                  decoration: InputDecoration(labelText: 'Tarifa adulto'),
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
