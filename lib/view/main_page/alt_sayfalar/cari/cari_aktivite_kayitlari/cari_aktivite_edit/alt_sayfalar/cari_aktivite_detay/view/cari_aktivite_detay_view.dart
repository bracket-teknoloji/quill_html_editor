import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../../../../core/base/view/base_scaffold.dart";
import "../../../../../../../../../core/components/card/cari_aktivite_detay_card.dart";
import "../../../../../../../../../core/components/floating_action_button/custom_floating_action_button.dart";
import "../../../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../model/cari_aktivite_listesi_model.dart";
import "../view_model/cari_aktivite_detay_view_model.dart";

final class CariAktiviteDetayView extends StatefulWidget {
  const CariAktiviteDetayView({required this.baseEditEnum, super.key});
  final BaseEditEnum baseEditEnum;

  @override
  State<CariAktiviteDetayView> createState() => _CariAktiviteDetayViewState();
}

final class _CariAktiviteDetayViewState extends State<CariAktiviteDetayView> {
  final CariAktiviteDetayViewModel viewModel = CariAktiviteDetayViewModel();

  @override
  Widget build(BuildContext context) => BaseScaffold(
        floatingActionButton: !widget.baseEditEnum.goruntuleMi ? fab() : null,
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
                      if ((result?.isSuccess ?? false) || (widget.baseEditEnum.ekleMi)) {
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

  CustomFloatingActionButton fab() => CustomFloatingActionButton(
        isScrolledDown: true,
        onPressed: () async {
          final result = await Get.toNamed("/mainPage/cariAktiviteDetayiEdit", arguments: BaseEditModel<CariAktiviteListesiModel>(baseEditEnum: widget.baseEditEnum));
          if (result is CariAktiviteListesiModel) {
            viewModel.addAktivite(result);
          }
        },
      );
}
