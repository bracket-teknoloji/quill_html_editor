import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";
import "package:location/location.dart" hide PermissionStatus;
import "package:permission_handler/permission_handler.dart";

import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../core/gen/assets.gen.dart";
import "../../cari_listesi/model/cari_listesi_model.dart";
import "../view_model/cari_haritasi_view_model.dart";

typedef Konum = ({double? enlem, double? boylam});

final class CariHaritasiView extends StatefulWidget {
  const CariHaritasiView({super.key, this.isGetData, this.konum, this.model});
  final bool? isGetData;
  final CariListesiModel? model;
  final Konum? konum;

  @override
  State<CariHaritasiView> createState() => CariHaritasiViewState();
}

final class CariHaritasiViewState extends BaseState<CariHaritasiView> {
  final CariHaritasiViewModel viewModel = CariHaritasiViewModel();
  GoogleMapController? _controller;
  double? latMe;
  double? longMe;
  final Location _locationTracker = Location();
  // final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  CameraPosition myLocation = const CameraPosition(target: LatLng(0, 0), zoom: 14.4746);
  @override
  void initState() {
    // setMarker();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final bool locationEnabled = await isLocationEnabled();
      if (!locationEnabled) {
        viewModel.setIsLocationEnabled(locationEnabled);
        dialogManager.showLocationDialog();
      }
      if (widget.isGetData == null) {
        await viewModel.getData();
      } else {
        if (widget.model case final value?) {
          viewModel.setCariList([value]);
        }
      }
      if ((widget.konum?.enlem != null && widget.konum?.boylam != null) || widget.model != null) {
        await setCameraPosition();
      }
      // markerIcon = await setMarker();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<bool> isLocationEnabled() async {
    final PermissionStatus permissionStatus = await Permission.location.request();
    if (permissionStatus == PermissionStatus.denied) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Observer(
        builder:
            (_) => AppBarTitle(
              title: "Cari Haritası",
              subtitle: viewModel.cariList?.length.toStringIfNotNull,
              // subtitle: viewModel.currentPosition?.latitude.toIntIfDouble.toStringIfNotNull,
            ),
      ),
      actions: [
        if (widget.isGetData == true)
          IconButton(
            onPressed: () async => Get.back(result: viewModel.currentPosition),
            icon: const Icon(Icons.save_outlined),
          ),
      ],
    ),
    body: Observer(
      builder: (_) {
        if (viewModel.cariList == null && widget.isGetData == null) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        return Stack(
          children: [
            Observer(
              builder:
                  (_) => GoogleMap(
                    style: googleMapsStyle(),
                    clusterManagers: {
                      ClusterManager(
                        clusterManagerId: const ClusterManagerId("value"),
                        onClusterTap: (argument) {
                          _controller?.animateCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(
                                target: LatLng(argument.position.latitude, argument.position.longitude),
                                zoom: 15.5,
                              ),
                            ),
                          );
                        },
                      ),
                    },
                    initialCameraPosition: myLocation,
                    webGestureHandling: WebGestureHandling.greedy,
                    onMapCreated: (controller) async {
                      if (_controller == null) {
                        _controller = controller;
                        await setCameraPosition();
                      }
                      for (final CariListesiModel? model in viewModel.cariList ?? []) {
                        viewModel.addMarker(
                          Marker(
                            icon: await setMarker(model),
                            clusterManagerId: const ClusterManagerId("value"),
                            markerId: MarkerId(model?.cariKodu ?? ""),
                            onTap: () => dialogManager.showCariIslemleriGridViewDialog(model),
                            position: LatLng(model?.enlem ?? 0, model?.boylam ?? 0),
                            // infoWindow: widget.isGetData == true
                            //     ? InfoWindow.noText
                            //     : InfoWindow(
                            //         title: model?.cariAdi,
                            //         snippet: model?.cariKodu,
                            //         onTap: () => dialogManager.showCariIslemleriGridViewDialog(model),
                            //       ),
                          ),
                        );
                        // _controller.complete(controller);
                        // if (widget.isGetData != true) {
                        //   }
                      }
                      setState(() {});
                    },
                    myLocationEnabled: true,
                    markers: viewModel.markerSet,
                    onCameraMove:
                        widget.isGetData != true
                            ? null
                            : (position) {
                              viewModel.setCurrentPosition(position.target);
                            },
                  ),
            ),
            if (widget.isGetData == true)
              Center(child: Assets.lotties.locationLottie.lottie()).paddingOnly(bottom: UIHelper.midSize * 3),
          ],
        );
      },
    ),
    // floatingActionButton: FloatingActionButton.extended(
    //   onPressed: _goToTheLake,
    //   label: const Text("To the lake!"),
    //   icon: const Icon(Icons.directions_boat),
    // ),
  );

  String googleMapsStyle() {
    if (theme.brightness == Brightness.dark) {
      return """[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#1d2c4d"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#8ec3b9"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#1a3646"
      }
    ]
  },
  {
    "featureType": "administrative.country",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#4b6878"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#64779e"
      }
    ]
  },
  {
    "featureType": "administrative.province",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#4b6878"
      }
    ]
  },
  {
    "featureType": "landscape.man_made",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#334e87"
      }
    ]
  },
  {
    "featureType": "landscape.natural",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#023e58"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#283d6a"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#6f9ba5"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#1d2c4d"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#023e58"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#3C7680"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#304a7d"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#98a5be"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#1d2c4d"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#2c6675"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [
      {
        "color": "#255763"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#b0d5ce"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#023e58"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#98a5be"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#1d2c4d"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#283d6a"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#3a4762"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#0e1626"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#4e6d70"
      }
    ]
  }
]
""";
    }
    return """
[
{
  "elementType": "geometry",
  "stylers": [
    {
      "color": "#ebe3cd"
    }
  ]
},
{
  "elementType": "labels.text.fill",
  "stylers": [
    {
      "color": "#523735"
    }
  ]
},
{
  "elementType": "labels.text.stroke",
  "stylers": [
    {
      "color": "#f5f1e6"
    }
  ]
},
{
  "featureType": "administrative",
  "elementType": "geometry.stroke",
  "stylers": [
    {
      "color": "#c9b2a6"
    }
  ]
},
{
  "featureType": "administrative.land_parcel",
  "elementType": "geometry.stroke",
  "stylers": [
    {
      "color": "#dcd2be"
    }
  ]
},
{
  "featureType": "administrative.land_parcel",
  "elementType": "labels.text.fill",
  "stylers": [
    {
      "color": "#ae9e90"
    }
  ]
},
{
  "featureType": "landscape.natural",
  "elementType": "geometry",
  "stylers": [
    {
      "color": "#dfd2ae"
    }
  ]
},
{
  "featureType": "poi",
  "elementType": "geometry",
  "stylers": [
    {
      "color": "#dfd2ae"
    }
  ]
},
{
  "featureType": "poi",
  "elementType": "labels.text.fill",
  "stylers": [
    {
      "color": "#93817c"
    }
  ]
},
{
  "featureType": "poi.park",
  "elementType": "geometry.fill",
  "stylers": [
    {
      "color": "#a5b076"
    }
  ]
},
{
  "featureType": "poi.park",
  "elementType": "labels.text.fill",
  "stylers": [
    {
      "color": "#447530"
    }
  ]
},
{
  "featureType": "road",
  "elementType": "geometry",
  "stylers": [
    {
      "color": "#f5f1e6"
    }
  ]
},
{
  "featureType": "road.arterial",
  "elementType": "geometry",
  "stylers": [
    {
      "color": "#fdfcf8"
    }
  ]
},
{
  "featureType": "road.highway",
  "elementType": "geometry",
  "stylers": [
    {
      "color": "#f8c967"
    }
  ]
},
{
  "featureType": "road.highway",
  "elementType": "geometry.stroke",
  "stylers": [
    {
      "color": "#e9bc62"
    }
  ]
},
{
  "featureType": "road.highway.controlled_access",
  "elementType": "geometry",
  "stylers": [
    {
      "color": "#e98d58"
    }
  ]
},
{
  "featureType": "road.highway.controlled_access",
  "elementType": "geometry.stroke",
  "stylers": [
    {
      "color": "#db8555"
    }
  ]
},
{
  "featureType": "road.local",
  "elementType": "labels.text.fill",
  "stylers": [
    {
      "color": "#806b63"
    }
  ]
},
{
  "featureType": "transit.line",
  "elementType": "geometry",
  "stylers": [
    {
      "color": "#dfd2ae"
    }
  ]
},
{
  "featureType": "transit.line",
  "elementType": "labels.text.fill",
  "stylers": [
    {
      "color": "#8f7d77"
    }
  ]
},
{
  "featureType": "transit.line",
  "elementType": "labels.text.stroke",
  "stylers": [
    {
      "color": "#ebe3cd"
    }
  ]
},
{
  "featureType": "transit.station",
  "elementType": "geometry",
  "stylers": [
    {
      "color": "#dfd2ae"
    }
  ]
},
{
  "featureType": "water",
  "elementType": "geometry.fill",
  "stylers": [
    {
      "color": "#b9d3c2"
    }
  ]
},
{
  "featureType": "water",
  "elementType": "labels.text.fill",
  "stylers": [
    {
      "color": "#92998d"
    }
  ]
}
]""";
  }

  Future<BitmapDescriptor> setMarker(CariListesiModel? model) => Column(
    mainAxisAlignment: MainAxisAlignment.end,
    mainAxisSize: MainAxisSize.min,
    children: [
      ConstrainedBox(
        constraints: BoxConstraints(maxWidth: width * 0.9),
        child: ElevatedButton(
          onPressed: () => dialogManager.showCariIslemleriGridViewDialog(model),
          style: theme.elevatedButtonTheme.style?.copyWith(elevation: const WidgetStatePropertyAll(10)),
          child: Text(
            model?.cariAdi ?? "",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24),
            maxLines: 2,
          ).paddingAll(UIHelper.lowSize),
        ),
      ),
      Assets.splash.mapMarker.image(height: 50).paddingOnly(top: UIHelper.lowSize),
    ],
  ).toBitmapDescriptor(logicalSize: Size(width * 1.9, height * 1.5));

  Future<void> setCameraPosition() async {
    try {
      if (widget.konum case final value?) {
        myLocation = CameraPosition(target: LatLng(value.enlem ?? 0, value.boylam ?? 0), zoom: 15.5);
      } else if (widget.model case final value?) {
        myLocation = CameraPosition(target: LatLng(value.enlem ?? 0, value.boylam ?? 0), zoom: 15.5);
      } else {
        final location = await _locationTracker.getLocation();
        myLocation = CameraPosition(target: LatLng(location.latitude ?? 0, location.longitude ?? 0), zoom: 15.5);
      }
      _controller?.animateCamera(CameraUpdate.newCameraPosition(myLocation));
    } catch (e) {
      dialogManager.showAlertDialog(e.toString());
    }
  }
}
