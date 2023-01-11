import 'package:flutter/material.dart';
import 'package:mapa01/ui/pages/BNavigation/bottom_nav.dart';
import 'package:mapa01/ui/pages/DrawerPanel/drawer_panel.dart';
import 'package:mapa01/ui/pages/BNavigation/BNroutes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  BNavigator? myBNB;
  @override
  void initState() {
    myBNB = BNavigator(currentIndex: (i) {
      setState(() {
        index = i;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//APPBAR
      appBar: AppBar(
        title: const Text('App Travel InterUrban'),
      ),

//DRAWER PANEL
      drawer: const DrawerPanel(),

//BOTON NAVIGATOR
      bottomNavigationBar: myBNB,
      //   body: Stack(
      //     alignment: AlignmentDirectional.bottomCenter,
      //     children: <Widget>[
      //       Expanded(
      //         child: BNroutes(index: index),
      //       ),
      //     ],
      //   ),
      // );
      body: BNroutes(
        index: index,
      ),
    );
  }
}
