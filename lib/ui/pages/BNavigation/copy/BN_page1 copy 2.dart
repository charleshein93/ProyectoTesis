// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:ui' as ui;
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapa01/ui/pages/home/home_controller.dart';
import 'package:provider/provider.dart';

class BNPage1 extends StatefulWidget {
  const BNPage1({super.key});

  @override
  State<BNPage1> createState() => _BNPage1State();
}

class _BNPage1State extends State<BNPage1> {
  //MARCADORES
  Uint8List? markerImage;
  // List<String> imagen = ['assets/paradero2.png'];
  final String imagen = 'assets/paradero1.png';
  final List<Marker> _markers2 = <Marker>[];
  final List<LatLng> _latlong2 = <LatLng>[
    const LatLng(-40.333099, -72.957304),
    const LatLng(-40.33342417576287, -72.9512893346416),
    const LatLng(-40.321370304451186, -72.9774995473586),
    const LatLng(-40.321370304451186, -72.9774995473586),
    const LatLng(-40.319622959242494, -72.98912861231328),
    const LatLng(-40.31900422390641, -72.99445973556087),
    const LatLng(-40.31822804412061, -73.0075087981009),
    const LatLng(-40.31459466731465, -73.02308164797115),
    const LatLng(-40.31274387266943, -73.03024814242885),
    const LatLng(-40.30596031396382, -73.06951671369646),
    const LatLng(-40.29391788153827, -73.0730213929979),
    const LatLng(-40.294244300509554, -73.07787772352286),
    const LatLng(-40.297151236803465, -73.0787861026098),
    const LatLng(-40.293995798843724, -73.0734037057384),
    const LatLng(-40.29848185343948, -73.0741343972341),
    const LatLng(-40.30181370585891, -73.07581665558548),
    const LatLng(-40.306166837804916, -73.06944068636102),
    const LatLng(-40.306570671104545, -73.06512418200498),
    const LatLng(-40.30638089706616, -73.06024798340358),
    const LatLng(-40.30620447741037, -73.06001463123825),
    const LatLng(-40.306251240549486, -73.05731477696746),
    const LatLng(-40.31468322930686, -73.02314131757637),
    const LatLng(-40.33342417576287, -72.9512893346416),
    const LatLng(-40.31827340225943, -73.00793548234844),
    const LatLng(-40.319093734761644, -72.99682934745222),
    const LatLng(-40.319910019100135, -72.98862161133795),
    const LatLng(-40.32116099251506, -72.98367110545742),
    const LatLng(-40.32152706143689, -72.97467692228794),
    const LatLng(-40.32170755281988, -72.96958473359004),
    const LatLng(-40.32670558138505, -72.95994744816691),
    const LatLng(-40.33422397830666, -72.95665544615429),
    const LatLng(-40.33309095261782, -72.95459395580322),
    const LatLng(-40.333143310065694, -72.95201449919946),
  ];

  Future<Uint8List> getBytesFromAssets(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    for (int i = 0; i < _latlong2.length; i++) {
      final Uint8List markerIcon = await getBytesFromAssets(imagen, 50);
      _markers2.add(Marker(
        markerId: MarkerId(i.toString()),
        position: _latlong2[i],
        icon: BitmapDescriptor.fromBytes(markerIcon),
        infoWindow: InfoWindow(title: 'Paradero: ' + i.toString()),
      ));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeController>(
      create: (_) {
        final controller = HomeController();
        controller.onMarkerTap.listen(
          (String id) {},
        );
        return controller;
      },
      child: Scaffold(
        body: Selector<HomeController, bool>(
          selector: (_, controller) => controller.loading,
          builder: (context, loading, loadingWidget) {
            if (loading) {
              return loadingWidget!;
            }
            return Consumer<HomeController>(
              builder: (_, controller, gpsMessageWidget) {
                if (!controller.gpsEnabled) {
                  return gpsMessageWidget!;
                }

                return GoogleMap(
                  initialCameraPosition: controller.initialCameraPosition,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  zoomControlsEnabled: true,
                  mapType: MapType.normal,
                  // markers: controller.markers,
                  markers: Set<Marker>.of(_markers2),

                  onLongPress: controller.onTap,
                );
              },
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Para acceder a la localización debe activar el GPS del dispositivo',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final controller = context.read<HomeController>();
                        controller.encenderGPS();
                      },
                      child: const Text('Encender GPS'),
                    ),
                  ],
                ),
              ),
            );
          },
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
