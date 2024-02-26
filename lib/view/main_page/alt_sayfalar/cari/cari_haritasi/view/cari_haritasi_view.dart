import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";
import "package:location/location.dart" hide PermissionStatus;
import "package:permission_handler/permission_handler.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/gen/assets.gen.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_haritasi/view_model/cari_haritasi_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";

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
  // final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  CameraPosition myLocation = const CameraPosition(
    target: LatLng(0, 0),
    zoom: 14.4746,
  );
  @override
  void initState() {
    if (widget.konum != null) {
      myLocation = CameraPosition(
        target: LatLng(widget.konum?.$1 ?? 0, widget.konum?.$2 ?? 0),
        zoom: 14.4746,
      );
    }
    // setMarker();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.konum == null) {
        await setCameraPosition();
      }
      final bool locationEnabled = await isLocationEnabled();
      if (!locationEnabled) {
        viewModel.setIsLocationEnabled(locationEnabled);
        dialogManager.showLocationDialog();
      }
      if (widget.isGetData != true) {
        await viewModel.getData();
      }

      // markerIcon = await setMarker();
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
              subtitle: viewModel.cariList?.length.toStringIfNotNull,
              // subtitle: viewModel.currentPosition?.latitude.toIntIfDouble.toStringIfNotNull,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () async => Get.back(result: viewModel.currentPosition),
              icon: const Icon(Icons.save_outlined),
            ).yetkiVarMi(widget.isGetData == true),
          ],
        ),
        body: Observer(
          builder: (_) {
            if (viewModel.cariList == null && widget.isGetData != true) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            return Stack(
              children: [
                Observer(
                  builder: (_) => GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: myLocation,
                    onMapCreated: (controller) async {
                      if (widget.isGetData != true) {
                        for (CariListesiModel? model in viewModel.cariList ?? []) {
                          viewModel.addMarker(
                            Marker(
                              icon: await setMarker(model),
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
                        }
                      }
                      setState(() {});
                    },
                    buildingsEnabled: true,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    markers: viewModel.markerSet,
                    onCameraMove: widget.isGetData != true
                        ? null
                        : (position) {
                            viewModel.setCurrentPosition(position.target);
                          },
                  ),
                ),
                Center(child: Assets.lotties.locationLottie.lottie()).paddingOnly(bottom: UIHelper.midSize * 3).yetkiVarMi(widget.isGetData == true),
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

  Future<BitmapDescriptor> setMarker(CariListesiModel? model) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: width * 0.5,
            child: ElevatedButton(
              onPressed: () => dialogManager.showCariIslemleriGridViewDialog(model),
              style: const ButtonStyle(elevation: MaterialStatePropertyAll(10)),
              child: Text(
                model?.cariAdi ?? "",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 2,
              ).paddingAll(UIHelper.lowSize),
            ),
          ),
          Assets.splash.mapMarker.image(height: 30).paddingOnly(top: UIHelper.lowSize),
        ],
      ).toBitmapDescriptor();

  Future<void> setCameraPosition() async {
    // setState(() {});
    final location = await _locationTracker.getLocation();
    myLocation = CameraPosition(
      target: LatLng(location.latitude ?? 0, location.longitude ?? 0),
      zoom: 14.4746,
    );
    setState(() {});
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
