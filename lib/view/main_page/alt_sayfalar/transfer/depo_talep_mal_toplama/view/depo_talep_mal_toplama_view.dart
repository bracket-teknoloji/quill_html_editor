import "package:flutter_mobx/flutter_mobx.dart";
import "package:picker/app/picker_app_imports.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/components/bottom_bar/bottom_bar.dart";
import "package:picker/core/components/button/elevated_buttons/footer_button.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/extensions/iterable_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparis_edit_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/transfer/depo_talep_mal_toplama/view_model/depo_talep_mal_toplama_view_model.dart";

final class DepoTalepMalToplamaView extends StatefulWidget {
  const DepoTalepMalToplamaView({required this.model, super.key});

  final BaseSiparisEditModel model;

  @override
  State<DepoTalepMalToplamaView> createState() => _DepoTalepMalToplamaViewState();
}

final class _DepoTalepMalToplamaViewState extends BaseState<DepoTalepMalToplamaView> {
  final DepoTalepMalToplamaViewModel viewModel = DepoTalepMalToplamaViewModel();
  BaseSiparisEditModel get model => widget.model;
  late final TextEditingController _depoController;

  @override
  void initState() {
    if (CacheManager.getProfilParametre.depoTalepDepoList case final value?) viewModel.setDepoList(value);
    _depoController = TextEditingController(text: viewModel.depoList?.depoTanimi);
    viewModel.setModel(model);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getKalemler();
    });
    super.initState();
  }

  @override
  void dispose() {
    _depoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: appBar(),
        body: body(),
        bottomNavigationBar: bottomBar(),
      );

  AppBar appBar() => AppBar(
        title: AppBarTitle(
          title: "Depo Talep Mal Toplama",
          subtitle: "#${model.id.toStringIfNotNull}",
        ),
        actions: [
          IconButton(
            onPressed: () async {
              if (viewModel.model?.kalemler?.any((element) => element.tamamlananMiktar != 0) ?? false) {
                final result = await networkManager.postFatura(context, SiparisEditRequestModel.forTalepMalToplama(viewModel.model!));
                if (result != null) {
                  Get.toNamed(
                    "mainPage/transferEdit",
                    arguments: BaseEditModel(
                      editTipiEnum: EditTipiEnum.depoTransferi,
                      baseEditEnum: BaseEditEnum.ekle,
                      model: result,
                    ),
                  );
                }
              } else {
                dialogManager.showAlertDialog("Hiçbir kalemi toplamadan devam edemezsiniz.");
              }
            },
            icon: const Icon(Icons.send_outlined),
          ),
        ],
      );

  Widget body() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            labelText: "Toplama Yapılan Depo",
            isMust: true,
            suffixMore: true,
            readOnly: true,
            controller: _depoController,
            valueWidget: Observer(builder: (_) => Text(viewModel.depoList?.depoKodu.toStringIfNotNull ?? "")),
            onTap: () async {
              final depo = await bottomSheetDialogManager.showDepoBottomSheetDialog(context, viewModel.depoList?.depoKodu);
              if (depo case final value?) {
                _depoController.text = value.depoTanimi ?? "";
                viewModel.setDepoList(value);
              }
            },
          ),
          CustomTextField(
            labelText: "Stok kodu/barkod giriniz...",
            suffixMore: true,
            onSubmitted: searchKalem,
            suffix: IconButton(
              onPressed: () async {
                final result = await Get.toNamed("qr");
                if (result case final String value?) {
                  searchKalem(value);
                }
              },
              icon: const Icon(Icons.qr_code_scanner_outlined),
            ),
          ),
          Expanded(
            child: Observer(
              builder: (_) => RefreshableListView(
                onRefresh: viewModel.getKalemler,
                items: viewModel.model?.kalemler,
                itemBuilder: (item) => Card(
                  color: getCardColor(item),
                  child: ListTile(
                    onTap: () async {
                      if (viewModel.depoList == null) return dialogManager.showAlertDialog("Depo seçiniz.");
                      if (item.isTamamlandi) return dialogManager.showInfoSnackBar("Bu kalem tamamlandı.");
                      final result = await Get.toNamed(
                        "mainPage/depoMalToplamaKalemEkle",
                        arguments: item.copyWith(
                          depoKodu: viewModel.depoList?.depoKodu,
                          depoTanimi: viewModel.depoList?.depoTanimi,
                        ),
                      );
                      if (result case final KalemModel value?) {
                        final success = await viewModel.saveKalem(value);
                        if (success) dialogManager.showSuccessSnackBar("Kalem eklendi");
                        await viewModel.getKalemler();
                      }
                    },
                    title: Text(item.stokAdi ?? ""),
                    trailing: IconButton(
                      onPressed: () {
                        bottomSheetDialogManager.showBottomSheetDialog(
                          context,
                          title: "İşlemler",
                          children: [
                            BottomSheetModel(
                              title: "Toplananlar",
                              iconWidget: Icons.library_add_check_outlined,
                              onTap: () async {
                                Get.back();
                                await Get.toNamed("mainPage/transferTalepToplananlar", arguments: item);
                                await viewModel.getKalemler();
                              },
                            ),
                            BottomSheetModel(
                              title: "Stok İşlemleri",
                              iconWidget: Icons.list_alt_outlined,
                              onTap: () async {
                                Get.back();
                                dialogManager.showStokGridViewDialog(await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: item.stokKodu)));
                              },
                            ),
                          ],
                        );
                      },
                      icon: const Icon(Icons.more_vert_outlined),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (item.stokKodu case final value?) Text(value).paddingSymmetric(vertical: UIHelper.lowSize),
                        CustomLayoutBuilder.divideInHalf(
                          children: [
                            Text("Miktar: ${item.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                            Text("Toplanan Miktar: ${item.tamamlananMiktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                            Text("Kalan Miktar: ${item.kalanMiktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ).paddingAll(UIHelper.lowSize);

  void searchKalem(String value) {
    if (viewModel.model?.kalemler?.isEmpty ?? false) return dialogManager.showErrorSnackBar("Kalem bulunamadı");
    if (viewModel.model?.kalemler?.firstWhereOrNull((element) => element.stokKodu?.toUpperCase() == value.toUpperCase()) == null) {
      dialogManager.showAlertDialog("Stok bulunamadı");
    } else {
      editKalem(viewModel.model!.kalemler!.firstWhere((element) => element.stokKodu?.toUpperCase() == value.toUpperCase()));
    }
  }

  Widget bottomBar() => BottomBarWidget(
        isScrolledDown: true,
        children: [
          FooterButton(
            children: [
              const Text("Miktar"),
              Observer(
                builder: (_) => Text(viewModel.model?.kalemler?.map((e) => e.miktar ?? 0).sum.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? ""),
              ),
            ],
          ),
          FooterButton(
            children: [
              const Text("Toplanan Miktar"),
              Observer(
                builder: (_) => Text(viewModel.model?.kalemler?.map((e) => e.tamamlananMiktar ?? 0).sum.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? ""),
              ),
            ],
          ),
          FooterButton(
            children: [
              const Text("Kalan Miktar"),
              Observer(
                builder: (_) => Text(viewModel.model?.kalemler?.map((e) => e.kalanMiktar ?? 0).sum.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? ""),
              ),
            ],
          ),
        ],
      );

  Color? getCardColor(KalemModel item) {
    if (item.isTamamlandi) {
      return ColorPalette.mantis.withValues(alpha: 0.5);
    }
    if (item.isToplaniyor) {
      return ColorPalette.gamboge.withValues(alpha: 0.5);
    }
    return null;
  }

  Future<void> editKalem(KalemModel item) async {
    if (viewModel.depoList == null) return dialogManager.showAlertDialog("Depo seçiniz.");
    if (item.isTamamlandi) return dialogManager.showInfoSnackBar("Bu kalem tamamlandı.");
    final result = await Get.toNamed(
      "mainPage/depoMalToplamaKalemEkle",
      arguments: item.copyWith(
        depoKodu: viewModel.depoList?.depoKodu,
        depoTanimi: viewModel.depoList?.depoTanimi,
      ),
    );
    if (result case final KalemModel value?) {
      final success = await viewModel.saveKalem(value);
      if (success) dialogManager.showSuccessSnackBar("Kalem eklendi");
      await viewModel.getKalemler();
    }
  }
}
