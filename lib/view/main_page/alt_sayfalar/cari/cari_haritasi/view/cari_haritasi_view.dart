import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";
import "package:location/location.dart" hide PermissionStatus;
import "package:permission_handler/permission_handler.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/gen/assets.gen.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_haritasi/view_model/cari_haritasi_view_model.dart";

class CariHaritasiView extends StatefulWidget {
  final bool? isGetData;
  final (double? enlem, double? boylam)? konum;
  const CariHaritasiView({super.key, this.isGetData, this.konum});

  @override
  State<CariHaritasiView> createState() => CariHaritasiViewState();
}

class CariHaritasiViewState extends BaseState<CariHaritasiView> {
  CariHaritasiViewModel viewModel = CariHaritasiViewModel();
  double? latMe;
  double? longMe;
  final Location _locationTracker = Location();
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
      final bool locationEnabled = await isLocationEnabled();
      if (widget.konum != null) {
        myLocation = CameraPosition(
          target: LatLng(widget.konum?.$1 ?? 0, widget.konum?.$2 ?? 0),
          zoom: 14.4746,
        );
      }
      if (!locationEnabled) {
        viewModel.setIsLocationEnabled(locationEnabled);
        dialogManager.showLocationDialog();
      }
      await viewModel.getData();
      if (widget.konum == null) {
        await setCameraPosition();
      }
    });
    super.initState();
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
            builder: (_) => AppBarTitle(
              title: "Cari Haritası",
              // subtitle: viewModel.cariList?.length.toStringIfNotNull,
              subtitle: viewModel.currentPosition?.latitude.toIntIfDouble.toStringIfNotNull,
            ),
          ),
          actions: const [
            // IconButton(onPressed: ()async {}, icon: Icon(Icons.))
          ],
        ),
        body: Observer(
          builder: (_) {
            if (viewModel.cariList == null) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            return Stack(
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: myLocation,
                  onMapCreated: _controller.complete,
                  buildingsEnabled: true,
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
                                onTap: () => dialogManager.showCariIslemleriGridViewDialog(element),
                              ),
                            ),
                          )
                          .toSet() ??
                      {},
                  onCameraMove: widget.isGetData != true
                      ? null
                      : (position) {
                          viewModel.setCurrentPosition(position.target);
                        },
                ),
                Observer(
                  builder: (_) => Center(child: Assets.lotties.locationLottie.lottie()).yetkiVarMi(widget.isGetData == true),
                ),
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

  void setMarker() {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        size: Size(32, 32),
      ),
      Assets.splash.mapMarker.path,
    ).then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  Future<void> setCameraPosition() async {
    // setState(() {});
    final location = await _locationTracker.getLocation();
    myLocation = CameraPosition(
      target: LatLng(location.longitude ?? 0, location.latitude ?? 0),
    );
    // if (isLocationEnabled) {
    // }
    // await Location.instance.getLocation().then((value) {
    //   setState(() {
    //     myLocation = CameraPosition(
    //       target: LatLng(value.altitude ?? 0, value.longitude ?? 0),
    //       zoom: 14.4746,
    //     );
    //   });
    // });
  }

  // Future<void> checkIsLocationEnabled() async {
  //   isLocationEnabled = await _locationTracker.serviceEnabled();
  //   setState(() {});
  //   if (isLocationEnabled) {
  //     final location = await _locationTracker.getLocation();
  //     latMe = location.latitude;
  //     longMe = location.longitude;
  //   }
  //   setState(() {
  //     isLocationEnabledChecked = true;
  //   });
  // }
}
