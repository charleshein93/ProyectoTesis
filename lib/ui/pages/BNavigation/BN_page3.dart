// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BNPage3 extends StatefulWidget {
  const BNPage3({super.key});

  @override
  State<BNPage3> createState() => _BNPage3State();
}

class _BNPage3State extends State<BNPage3> {
  // bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // const Icon(
            //   Icons.search,
            //   size: 50,
            // ),

//TEXTO PRINCIPAL

            Text(
              'Consulta horarios/precios',
              style: GoogleFonts.bebasNeue(
                fontSize: 25,
              ),
            ),

            const SizedBox(height: 10), //espacio

//TEXTFIELD Buscador

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '',
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10), //espacio

            Text(
              'Recorridos registrados',
              style: GoogleFonts.bebasNeue(
                fontSize: 25,
              ),
            ),

//BOTON Busqueda

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
            //   child: Container(
            //     padding: const EdgeInsets.all(20),
            //     child: Center(
            //       child: ElevatedButton(
            //         child: const Text('Buscar'),
            //         onPressed: () {},
            //       ),
            //     ),
            //   ),
            // ),

//BOTON LISTA EXPANDIBLE

            // const ExpansionTile(
            //   title: Text('Río Bueno - La Unión'),
            //   subtitle: Text('Horarios - Tarifa'),
            //   children: <Widget>[
            //     Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 15),
            //       child: ExpansionTile(
            //         title: Text('Tarifa'),
            //         children: <Widget>[
            //           Tarifa1(),
            //         ],
            //       ),
            //     ),
            //     Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 15),
            //       child: ExpansionTile(
            //         title: Text('Horario'),
            //         children: <Widget>[
            //           Horario1(),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),

            const ExpansionTile(
              title: Text('Río Bueno - La Unión'),
              subtitle: Text('Empresa Perez'),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ExpansionTile(
                    title: Text('Bus Toyota Blanco'),
                    subtitle: Text('Patente: SAFA-78'),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: ExpansionTile(
                          title: Text('Tarifa'),
                          children: <Widget>[
                            Tarifa1(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: ExpansionTile(
                          title: Text('Horario'),
                          children: <Widget>[
                            Horario1(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // ExpansionTile(
            //   title: const Text('Río Bueno - La Unión'),
            //   subtitle: const Text('Horarios - Tarifa'),
            //   children: <Widget>[
            //     const ListTile(title: Text('Empresa asociada...')),
            //     Image.network(
            //         'https://i.pinimg.com/564x/0a/9c/14/0a9c14af93c4ee5328693dfa6d4625e8.jpg'),
            //   ],
            // ),

            // ExpansionTile(
            //   title: const Text('Río Bueno - Lago Ranco'),
            //   subtitle: const Text('Horarios - Tarifa'),
            //   trailing: Icon(
            //     _customTileExpanded
            //         ? Icons.arrow_drop_down_circle
            //         : Icons.arrow_drop_down,
            //   ),
            //   children: <Widget>[
            //     const ListTile(title: Text('Empresa asociada...')),
            //     Image.network(
            //         'https://i.pinimg.com/564x/0a/9c/14/0a9c14af93c4ee5328693dfa6d4625e8.jpg'),
            //   ],
            //   onExpansionChanged: (bool expanded) {
            //     setState(() => _customTileExpanded = expanded);
            //   },
            // ),

            // const ExpansionTile(
            //   title: Text('ExpansionTile 3'),
            //   subtitle: Text('Leading expansion arrow icon'),
            //   controlAffinity: ListTileControlAffinity.leading,
            //   children: <Widget>[
            //     ListTile(title: Text('This is tile number 3')),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

class Horario1 extends StatelessWidget {
  const Horario1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text(
              'Salida',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Hora Salida',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text('Río bueno'),
            Text('7:30 AM'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text('La unión'),
            Text('8:30 AM'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text('Río bueno'),
            Text('9:30 AM'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text('La unión'),
            Text('10:30 AM'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text('Río bueno'),
            Text('11:30 AM'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text('La unión'),
            Text('12:30 PM'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text('Río bueno'),
            Text('3:30 PM'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text('La unión'),
            Text('4:30 AM'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text('Río bueno'),
            Text('5:30 PM'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text('La unión'),
            Text('6:30 AM'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text('Río bueno'),
            Text('7:30 PM'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text('La unión'),
            Text('8:30 AM'),
          ],
        ),
      ],
    );
  }
}

class Tarifa1 extends StatelessWidget {
  const Tarifa1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Río bueno',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Adulto',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Estudiante',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Festivo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('C.tambores'),
            Text('500'),
            Text('300'),
            Text('600'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('C.javier'),
            Text('600'),
            Text('400'),
            Text('800'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('La unión'),
            Text('1000'),
            Text('500'),
            Text('1200'),
          ],
        ),
      ],
    );
  }
}
