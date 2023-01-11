import 'package:flutter/material.dart';

class DrawerPanel extends StatefulWidget {
  const DrawerPanel({Key? key}) : super(key: key);

  @override
  State<DrawerPanel> createState() => _DrawerPanelState();
}

//DRAWER, PANEL LATERAL
class _DrawerPanelState extends State<DrawerPanel> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            child: Column(
              children: [
                Image.network(
                  'https://cdn-icons-png.flaticon.com/512/6073/6073873.png',
                  width: 90,
                  height: 90,
                ),
                const Text(
                  'Lionel Messirve',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'correo@correo.com',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          ListTile(
            leading: const Icon(Icons.door_back_door_outlined),
            title: const Text('Cerrar sesion'),
            onTap: () {
              Navigator.of(context).pushNamed('/login');
            },
          ),
        ],
      ),
    );
  }
}
