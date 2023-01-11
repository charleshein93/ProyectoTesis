// ignore_for_file: file_names
import 'package:flutter/material.dart';

class BNPage4 extends StatefulWidget {
  const BNPage4({super.key});

  @override
  State<BNPage4> createState() => _BNPage4State();
}

class _BNPage4State extends State<BNPage4> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
//TEXTO PRINCIPAL

          SizedBox(height: 15),

          Text(
            'Alertas registradas',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 35,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: ExpansionTile(
              title: Text(
                'Accidente',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Fecha: 13:45 - 29/12/2022',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: <Widget>[
                Text(
                  'Ocurrio un accidente en la ruta.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: ExpansionTile(
              title: Text(
                'Demora viaje',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Hora: 11:32 - 28/12/2022',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: <Widget>[
                Text(
                  'Bus se viaja muy lento',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: ExpansionTile(
              title: Text(
                'Trafico',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Hora: 8:17 - 16/12/2022',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: <Widget>[
                Text(
                  'Trafico en la ruta',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: ExpansionTile(
              title: Text(
                'Retraso',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Hora: 17:32 - 28/12/2022',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: <Widget>[
                Text(
                  'Transporte se demora en llegar',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
