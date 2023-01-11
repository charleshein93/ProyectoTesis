import 'dart:async';

import 'package:flutter/widgets.dart' show ChangeNotifier, Offset;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapa01/ui/pages/helpers/img_to_bytes.dart';
import 'package:geolocator/geolocator.dart';

import '../utils/map_style.dart';

class HomeController extends ChangeNotifier {
  //ESTILO DEL MAPA
  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
    _mapController = controller;
  }

  //MARKERS
  final Map<MarkerId, Marker> _markers = {};
  Set<Marker> get markers => _markers.values.toSet();
  final _markersController = StreamController<String>.broadcast();
  Stream<String> get onMarkerTap => _markersController.stream;
  late BitmapDescriptor _viajeroPin;

  //LOGO MARCADORES
  final _paraderoIcon = Completer<BitmapDescriptor>();

  //FUNCION DE PRUEBA - GENERAR MARCADORES
  void onTap(LatLng position) async {
    final id = _markers.length.toString();
    final markerId = MarkerId(id);
    final icon = await _paraderoIcon.future;
    final marker = Marker(
      markerId: markerId,
      position: position,
      icon: icon,
      onTap: () {
        _markersController.sink.add(id);
      },
    );
    _markers[markerId] = marker;
    notifyListeners();
  }

  //POSICION GPS SEGUN DONDE SE ENCUENTRA EL DISPOSITIVO
  Position? _initialPosition;
  CameraPosition get initialCameraPosition => CameraPosition(
        target: LatLng(
          _initialPosition!.latitude,
          _initialPosition!.longitude,
        ),
        zoom: 15,
      );

  bool _loading = true;
  bool get loading => _loading;

  //VARIABLES PARA HABILITAR GPS
  late bool _gpsEnabled;
  bool get gpsEnabled => _gpsEnabled;
  StreamSubscription? _gpsSubscription, _positionSubscription;
  GoogleMapController? _mapController;

  HomeController() {
    _init();
  }

  //FUNCION DE INICIO
  Future<void> _init() async {
    _viajeroPin = BitmapDescriptor.fromBytes(
      await imgToBytes('assets/viajero.png', width: 60, fromNetwork: false),
    );
    //INICIALIZA MARCADORES CON ESTA IMG DE INTERNET
    final value = await imgToBytes(
      'https://cdn-icons-png.flaticon.com/512/0/622.png',
      width: 150,
      fromNetwork: true,
    );
    //INICIALIZA SERVICIOS DE GPS
    final bitmap = BitmapDescriptor.fromBytes(value);
    _paraderoIcon.complete(bitmap);
    _gpsEnabled = await Geolocator.isLocationServiceEnabled();
    _loading = false;
    _gpsSubscription = Geolocator.getServiceStatusStream().listen(
      (status) async {
        _gpsEnabled = status == ServiceStatus.enabled;
        if (_gpsEnabled) {
          _initLocationUpdate();
        }
      },
    );
    _initLocationUpdate();
  }

  //FUNCION POSICION ACTUAL DEL DISPOSITIVO
  Future<void> _initLocationUpdate() async {
    bool initialized = false;
    _positionSubscription?.cancel();
    _positionSubscription = Geolocator.getPositionStream().listen(
      (position) async {
        _setMyPositionMarker(position);

        if (initialized) {
          notifyListeners();
        }

        if (!initialized) {
          _setInitialPosition(position);
          initialized = true;
          notifyListeners();
        }

        if (_mapController != null) {
          final zoom = await _mapController!.getZoomLevel();
          final cameraUpdate = CameraUpdate.newLatLngZoom(
            LatLng(position.latitude, position.longitude),
            zoom,
          );
          _mapController!.animateCamera(cameraUpdate);
        }
      },
      onError: (e) {
        // ignore: avoid_print
        print("asd onError ${e.runtimeType}");
        if (e is LocationServiceDisabledException) {
          _gpsEnabled = false;
          notifyListeners();
        }
      },
    );
  }

  //FUNCION PARA INICIAR TOMANDO EN CUENTA EL GPS Y LA POSICION INICIAL
  void _setInitialPosition(Position position) {
    if (_gpsEnabled && _initialPosition == null) {
      _initialPosition = position;
    }
  }

//FUNCION PIN DE MI POSICION
  void _setMyPositionMarker(Position position) {
    const markerId = MarkerId('my-position');
    final marker = Marker(
        markerId: markerId,
        position: LatLng(position.latitude, position.longitude),
        icon: _viajeroPin,
        anchor: const Offset(0.5, 0.5));
    _markers[markerId] = marker;
  }

  //FUNCION PARA ENTRAR CONFIGURACION DISPOSITIVO Y ACTIVAR/DESACTIVAR GPS
  Future<void> encenderGPS() => Geolocator.openLocationSettings();

  @override
  void dispose() {
    _positionSubscription?.cancel();
    _gpsSubscription?.cancel();
    _markersController.close();
    super.dispose();
  }
}
