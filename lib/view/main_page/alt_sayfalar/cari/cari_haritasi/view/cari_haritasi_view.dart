import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";
import "package:location/location.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/gen/assets.gen.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_haritasi/view_model/cari_haritasi_view_model.dart";

class CariHaritasiView extends StatefulWidget {
  const CariHaritasiView({super.key});

  @override
  State<CariHaritasiView> createState() => CariHaritasiViewState();
}

class CariHaritasiViewState extends State<CariHaritasiView> {
  CariHaritasiViewModel viewModel = CariHaritasiViewModel();
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  CameraPosition myLocation = const CameraPosition(
    target: LatLng(0, 0),
    zoom: 14.4746,
  );
  @override
  void initState() {
    // setMarker();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await setCameraPosition();
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) => AppBarTitle(
              title: "Cari Haritası",
              subtitle: viewModel.cariList?.length.toStringIfNotNull,
            ),
          ),
        ),
        body: Observer(
          builder: (_) {
            if (viewModel.cariList == null) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            return GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: myLocation,
              onMapCreated: _controller.complete,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              markers: viewModel.cariList
                      ?.map(
                        (element) => Marker(
                          icon: markerIcon,
                          markerId: MarkerId(element.cariKodu ?? ""),
                          position: LatLng(element.enlem ?? 0, element.boylam ?? 0),
                          infoWindow: InfoWindow(
                            title: element.cariAdi,
                            snippet: element.cariKodu,
                          ),
                        ),
                      )
                      .toSet() ??
                  {},
            );
          },
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: _goToTheLake,
        //   label: const Text("To the lake!"),
        //   icon: const Icon(Icons.directions_boat),
        // ),
      );


  void setMarker() {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      Assets.splash.pickerLogoTuruncu1024.path,
    ).then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  Future<void> setCameraPosition() async {
    await Location.instance.getLocation().then((value) {
      setState(() {
        myLocation = CameraPosition(
          target: LatLng(value.altitude ?? 0, value.longitude ?? 0),
          zoom: 14.4746,
        );
      });
    });
  }
}
