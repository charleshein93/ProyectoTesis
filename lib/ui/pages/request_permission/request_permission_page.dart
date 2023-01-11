import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mapa01/ui/pages/request_permission/request_permission_controller.dart';
import 'package:permission_handler/permission_handler.dart';

import '../routes/routes.dart';

class RequestPermissionPage extends StatefulWidget {
  const RequestPermissionPage({super.key});

  @override
  State<RequestPermissionPage> createState() => _RequestPermissionPageState();
}

class _RequestPermissionPageState extends State<RequestPermissionPage>
    with WidgetsBindingObserver {
  final _controller = RequestPermissionController(Permission.locationWhenInUse);
  late StreamSubscription _subscription;
  bool _fromSettings = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _subscription = _controller.onStatusChanged.listen(
      (status) {
        switch (status) {
          case PermissionStatus.granted:
            _goToLogin();
            break;
          case PermissionStatus.permanentlyDenied:
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text("INFO"),
                content: const Text(
                    "No se pudo recuperar el acceso al dispositivo, debe dar el permiso de forma manual"),
                actions: [
                  TextButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      _fromSettings = await openAppSettings();
                    },
                    child: const Text("Ajustes"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancelar"),
                  ),
                ],
              ),
            );

            break;
          case PermissionStatus.denied:
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text("INFO"),
                content: const Text(
                    "No se pudo recuperar el acceso al dispositivo, debe dar el permiso de forma manual"),
                actions: [
                  TextButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      _fromSettings = await openAppSettings();
                    },
                    child: const Text("Ajustes"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancelar"),
                  ),
                ],
              ),
            );
            break;
          case PermissionStatus.restricted:
            openAppSettings();
            break;
          case PermissionStatus.limited:
            openAppSettings();
            break;
        }
      },
    );
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    //print("State $state");
    if (state == AppLifecycleState.resumed && _fromSettings) {
      final status = await _controller.check();
      if (status == PermissionStatus.granted) {
        _goToLogin();
      }
    }
    _fromSettings = false;
  }

  void _goToLogin() {
    /* Navigator.pushReplacementNamed(context, Routes.HOME); */

    //REEDIRECCIONA A LOGIN
    Navigator.pushReplacementNamed(context, Routes.LOGIN);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _subscription.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: ElevatedButton(
            child: const Text("Permisos"),
            onPressed: () {
              _controller.request();
            },
          ),
        ),
      ),
    );
  }
}
