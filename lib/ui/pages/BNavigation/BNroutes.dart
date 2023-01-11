// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mapa01/ui/pages/BNavigation/BN_page1.dart';
import 'package:mapa01/ui/pages/BNavigation/BN_page2.dart';
import 'package:mapa01/ui/pages/BNavigation/BN_page3.dart';
import 'package:mapa01/ui/pages/BNavigation/BN_page4.dart';

class BNroutes extends StatelessWidget {
  final int index;
  const BNroutes({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      //MAPA
      const BNPage1(),
      //HORARIOS
      const BNPage3(),
      //BOTONES
      const BNPage2(),
      //ALERTAS
      const BNPage4(),
    ];
    return myList[index];
  }
}
