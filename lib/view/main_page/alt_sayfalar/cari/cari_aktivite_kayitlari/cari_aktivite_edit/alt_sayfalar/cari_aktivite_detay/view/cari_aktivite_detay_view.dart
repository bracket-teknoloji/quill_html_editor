import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/components/card/cari_aktivite_detay_card.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/cari_aktivite_edit/alt_sayfalar/cari_aktivite_detay/view_model/cari_aktivite_detay_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/model/cari_aktivite_listesi_model.dart";

class CariAktiviteDetayView extends StatefulWidget {
  final BaseEditEnum baseEditEnum;
  const CariAktiviteDetayView({super.key, required this.baseEditEnum});

  @override
  State<CariAktiviteDetayView> createState() => _CariAktiviteDetayViewState();
}

class _CariAktiviteDetayViewState extends State<CariAktiviteDetayView> {
  final CariAktiviteDetayViewModel viewModel = CariAktiviteDetayViewModel();

  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: CustomFloatingActionButton(
          isScrolledDown: !widget.baseEditEnum.goruntuleMi,
          onPressed: () async {
            final result = await Get.toNamed("/mainPage/cariAktiviteDetayiEdit", arguments: BaseEditModel<CariAktiviteListesiModel>(baseEditEnum: widget.baseEditEnum));
            if (result is CariAktiviteListesiModel) {
              viewModel.addAktivite(result);
            }
          },
        ),
        body: Observer(
          builder: (_) {
            if (viewModel.aktiviteList.isEmpty) {
              return const Center(child: Text("Aktivite Bulunamadı"));
            } else {
              return ListView.builder(
                padding: UIHelper.lowPadding,
                itemCount: viewModel.aktiviteList.length,
                itemBuilder: (_, index) {
                  final item = viewModel.aktiviteList[index];
                  return CariAktiviteDetayCard(
                    model: item,
                    baseEditEnum: widget.baseEditEnum,
                    onAktiviteSil: () async {
                      GenericResponseModel<NetworkManagerMixin>? result;
                      if (widget.baseEditEnum.duzenleMi) {
                        result = await viewModel.deleteDetay(item.id);
                      }
                      if (result?.success == true || (widget.baseEditEnum.ekleMi)) {
                        viewModel.deleteAktivite(item);
                      }
                    },
                    onAktiviteDuzenle: (value) async {
                      viewModel.replaceAktivite(item, value);
                    },
                  );
                },
              );
            }
          },
        ),
      );
}
