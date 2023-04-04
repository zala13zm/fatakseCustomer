import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:google_maps_flutter_web/google_maps_flutter_web.dart' as webGM;

void main() {
  runApp(
    MaterialApp(
      home: LocationPicker(),
    ),
  );
}

class MapPicker extends StatefulWidget {
  static const DEFAULT_ZOOM = 14.4746;
  static const KINSHASA_LOCATION = LatLng(-4.325, 15.322222);

  double initZoom;
  LatLng initCoordinates;

  LatLng value;

  MapPicker(
      {Key key,
      this.initZoom = DEFAULT_ZOOM,
      this.initCoordinates = KINSHASA_LOCATION})
      : super(key: key);

  @override
  State<MapPicker> createState() => _MapPickerState();
}

class _MapPickerState extends State<MapPicker> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          // width: 400,
          height: 300,
          child: LayoutBuilder(
            builder: (context, constraints) {
              var maxWidth = constraints.biggest.width;
              var maxHeight = constraints.biggest.height;

              return Stack(
                children: <Widget>[
                  SizedBox(
                    height: maxHeight,
                    width: maxWidth,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: widget.initCoordinates,
                        zoom: widget.initZoom,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      onCameraMove: (CameraPosition newPosition) {
                        // print(newPosition.target.toJson());
                        widget.value = newPosition.target;
                      },
                      mapType: MapType.normal,
                      myLocationButtonEnabled: true,
                      myLocationEnabled: false,
                      zoomGesturesEnabled: true,
                      padding: const EdgeInsets.all(0),
                      buildingsEnabled: true,
                      cameraTargetBounds: CameraTargetBounds.unbounded,
                      compassEnabled: true,
                      indoorViewEnabled: false,
                      mapToolbarEnabled: true,
                      minMaxZoomPreference: MinMaxZoomPreference.unbounded,
                      rotateGesturesEnabled: true,
                      scrollGesturesEnabled: true,
                      tiltGesturesEnabled: true,
                      trafficEnabled: false,
                    ),
                  ),
                  Positioned(
                    bottom: maxHeight / 2,
                    right: (maxWidth - 30) / 2,
                    child: const Icon(
                      Icons.person_pin_circle,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 30,
                    child: Container(
                      color: Colors.white,
                      child: IconButton(
                        onPressed: () async {
                          var position = await _determinePosition();
                          final GoogleMapController controller =
                              await _controller.future;
                          controller.animateCamera(
                              CameraUpdate.newCameraPosition(CameraPosition(
                                  target: LatLng(
                                      position.latitude, position.longitude),
                                  zoom: widget.initZoom)));
                        },
                        icon: const Icon(Icons.my_location),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}

class LocationPicker extends StatefulWidget {
  @override
  _LocationPickerState createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  LatLng _position = LatLng(0, 0);

  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();

    // Initialize the markers set with a single marker
    _markers.add(
      Marker(
        markerId: MarkerId('center'),
        position: _position,
        draggable: true,
        onDragEnd: (LatLng newPosition) {
          setState(() {
            _position = newPosition;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Location')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: _position, zoom: 15),
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {},
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // do something with the selected location
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
