// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapa01/ui/pages/home/home_controller.dart';
import 'package:provider/provider.dart';

class BNPage1 extends StatelessWidget {
  const BNPage1({super.key});

  getMarkerData() async {
    FirebaseFirestore.instance.collection('paradero');
  }

  @override
  Widget build(BuildContext context) {
    //MARCADORES
    Set<Marker> getMarker() {
      // ignore: prefer_collection_literals
      return <Marker>[
        const Marker(
          markerId: MarkerId('Paradero'),
          position: LatLng(-40.321439, -72.977506),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'Paradero'),
        ),
      ].toSet();
    }

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
                  markers: getMarker(),
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
