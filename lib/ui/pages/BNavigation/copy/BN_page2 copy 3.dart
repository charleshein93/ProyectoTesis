// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:mapa01/ui/pages/PageAvisos/Alertas1.dart';
import 'package:mapa01/ui/pages/PageAvisos/Aviso1.dart';
import 'package:mapa01/ui/pages/PageAvisos/Aviso2.dart';
import 'package:mapa01/ui/pages/PageAvisos/Aviso3.dart';

class BNPage2 extends StatelessWidget {
  const BNPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 30),
            const Text(
              'Ingrese Información',
              style: TextStyle(
                fontSize: 35,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Aviso1(),
                Aviso2(),
                Aviso3(),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Alertas',
              style: TextStyle(
                fontSize: 35,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Alerta1(),
          ],
        ),
      ),
    );
  }
}
