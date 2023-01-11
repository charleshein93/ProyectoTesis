import 'package:flutter/material.dart';

class BNavigator extends StatefulWidget {
  final Function currentIndex;

  const BNavigator({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<BNavigator> createState() => _BNavigatorState();
}

class _BNavigatorState extends State<BNavigator> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (int i) {
        setState(() {
          index = i;
          widget.currentIndex(i);
        });
      },
      selectedItemColor: Colors.green,
      iconSize: 25.0,
      selectedFontSize: 14.0,
      unselectedFontSize: 12.0,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: 'Información',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.widgets_outlined),
          label: 'Acciones',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.priority_high),
          label: 'Alertas',
        ),
      ],
    );
  }
}
