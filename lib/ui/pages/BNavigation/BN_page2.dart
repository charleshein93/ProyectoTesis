// ignore_for_file: file_names
import 'package:flutter/material.dart';

import 'package:mapa01/ui/pages/PageAvisos/Aviso1.dart';
import 'package:mapa01/ui/pages/PageAvisos/Aviso2.dart';
import 'package:mapa01/ui/pages/PageAvisos/Aviso3.dart';

class BNPage2 extends StatefulWidget {
  const BNPage2({Key? key}) : super(key: key);

  @override
  State<BNPage2> createState() => _BNPage2State();
}

class _BNPage2State extends State<BNPage2> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          // const SizedBox(height: 30),
          Text(
            'Agregar Información',
            style: TextStyle(
              fontSize: 35,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Avisos(),
          // SizedBox(height: 10),
          // Avisos(),
          // SizedBox(height: 10),
          // Alerta1(),
        ],
      ),
    );
  }
}

class Avisos extends StatelessWidget {
  const Avisos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Aviso1(),
        Aviso2(),
        Aviso3(),
      ],
    );
  }
}
