// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:mapa01/ui/pages/PageAvisos/Aviso1.dart';
import 'package:mapa01/ui/pages/PageAvisos/Aviso2.dart';
import 'package:mapa01/ui/pages/PageAvisos/Aviso3.dart';

class BNPage2 extends StatelessWidget {
  const BNPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Aviso1(),
          SizedBox(height: 30),
          Aviso2(),
          SizedBox(height: 30),
          Aviso3(),
        ],
      ),
    );
  }
}
