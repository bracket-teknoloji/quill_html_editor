import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";
import "package:location/location.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/kullanici_haritasi/model/kullanici_haritasi_model.dart";
import "package:picker/core/base/view/kullanici_haritasi/view_model/kullanici_haritasi_view_model.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/gen/assets.gen.dart";

class KullaniciHaritasiView extends StatefulWidget {
  const KullaniciHaritasiView({super.key});

  @override
  State<KullaniciHaritasiView> createState() => _KullaniciHaritasiViewState();
}

class _KullaniciHaritasiViewState extends BaseState<KullaniciHaritasiView> {
  final KullaniciHaritasiViewModel viewModel = KullaniciHaritasiViewModel();
  GoogleMapController? _controller;
  final Location _locationTracker = Location();
  CameraPosition myLocation = const CameraPosition(target: LatLng(0, 0), zoom: 14.4746);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await setCameraPosition();
      await viewModel.getData();
      viewModel.kullaniciHaritasiList?.forEach((element) async {
        viewModel.addMarker(
          Marker(
            markerId: MarkerId(element.kullanici ?? ""),
            clusterManagerId: const ClusterManagerId("value"),
            position: LatLng(element.enlem ?? 0, element.boylam ?? 0),
            icon: await setMarker(element),
          ),
        );
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(
      title: const AppBarTitle(title: "Kullanıcı Haritası"),
      actions: [
        IconButton(
          onPressed: () async {
            final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
              context,
              title: "Kullanıcıya Odaklan",
              groupValue: null,
              children: viewModel.kullaniciHaritasiList
                  ?.map(
                    (e) => BottomSheetModel(
                      title: e.kullaniciAdsoyad ?? "",
                      description:
                          "${e.kullanici} (${e.cihazMarka} - ${e.cihazModel})\n${DateTime.now().difference(e.tarih ?? DateTime.now()).inDays} gün önce",
                      value: e,
                    ),
                  )
                  .toList(),
            );
            if (result case final value?) {
              _controller?.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(target: LatLng(value.enlem ?? 0, value.boylam ?? 0), zoom: 15.5),
                ),
              );
            }
          },
          icon: const Icon(Icons.person_outline_outlined),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.filter_alt_outlined)),
      ],
    ),
    body: Observer(
      builder: (_) {
        if (viewModel.markerSet.length != viewModel.kullaniciHaritasiList?.length && viewModel.markerSet.isEmpty) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        return GoogleMap(
          initialCameraPosition: const CameraPosition(target: LatLng(1, 1)),
          webGestureHandling: WebGestureHandling.greedy,
          myLocationEnabled: true,
          markers: viewModel.markerSet,
          onMapCreated: (controller) {
            _controller = controller;
            _controller?.animateCamera(
              CameraUpdate.newCameraPosition(const CameraPosition(target: LatLng(1, 1), zoom: 15.5)),
            );
          },
          clusterManagers: {
            ClusterManager(
              clusterManagerId: const ClusterManagerId("value"),
              onClusterTap: (argument) {
                _controller?.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(target: LatLng(argument.position.latitude, argument.position.longitude), zoom: 15.5),
                  ),
                );
              },
            ),
          },
        );
      },
    ),
  );

  Future<BitmapDescriptor> setMarker(KullaniciHaritasiModel model) => Column(
    mainAxisAlignment: MainAxisAlignment.end,
    mainAxisSize: MainAxisSize.min,
    children: [
      ConstrainedBox(
        constraints: BoxConstraints(maxWidth: width * 0.9),
        child: ElevatedButton(
          onPressed: () {},
          style: theme.elevatedButtonTheme.style?.copyWith(elevation: const WidgetStatePropertyAll(10)),
          child: Column(
            children: [
              Text(
                model.kullaniciAdsoyad ?? "",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24),
                maxLines: 2,
              ),
              Text(
                "${model.kullanici} (${model.cihazMarka} - ${model.cihazModel})\n${model.tarih.toDateString}\nhız: ${model.hiz.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)} km/s",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ).paddingAll(UIHelper.lowSize),
        ),
      ),
      Assets.splash.mapMarker.image(height: 50).paddingOnly(top: UIHelper.lowSize),
    ],
  ).toBitmapDescriptor(logicalSize: Size(width * 1.9, height * 1.5));

  Future<void> setCameraPosition() async {
    try {
      final location = await _locationTracker.getLocation();
      myLocation = CameraPosition(target: LatLng(location.latitude ?? 0, location.longitude ?? 0), zoom: 15.5);
      _controller?.animateCamera(CameraUpdate.newCameraPosition(myLocation));
    } catch (e) {
      dialogManager.showAlertDialog(e.toString());
    }
  }
}
