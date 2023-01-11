// ignore_for_file: file_names
import 'package:flutter/material.dart';

import 'package:mapa01/ui/pages/PageAvisos/Aviso1.dart';
// import 'package:mapa01/ui/pages/PageAvisos/Aviso2.dart';
// import 'package:mapa01/ui/pages/PageAvisos/Aviso3.dart';

class BNPage2 extends StatelessWidget {
  const BNPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // Aviso1(),
          // SizedBox(height: 10),
          // Aviso2(),
          // SizedBox(height: 10),
          // Aviso3(),
          const SizedBox(height: 20),
          // ButtonSection(),

          Row(
            children: const [
              Aviso1(),
            ],
          ),

        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        CustomButton(
          icon: Icons.radar,
          text: 'Ingresar Alerta',
        ),
        CustomButton(
          icon: Icons.circle_notifications,
          text: 'Ingresar Horario',
        ),
        CustomButton(
          icon: Icons.edit_location_outlined,
          text: 'Ingresar Recorrido',
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.green,
          size: 50.0,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
