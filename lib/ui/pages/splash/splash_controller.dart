import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:mapa01/ui/pages/routes/routes.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashController extends ChangeNotifier {
  final Permission _locationPermission;
  String? _routeName;
  String? get routeName => _routeName;

  SplashController(this._locationPermission);

  Future<void> checkPermission() async {
    final isGranted = await _locationPermission.isGranted;
    _routeName = isGranted ? Routes.LOGIN : Routes.PERMISSIONS;
    notifyListeners();
  }
}
