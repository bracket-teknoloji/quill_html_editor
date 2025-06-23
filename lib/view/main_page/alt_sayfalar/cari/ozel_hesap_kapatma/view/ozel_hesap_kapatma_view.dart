import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/bottom_bar/bottom_bar.dart";
import "package:picker/core/components/button/elevated_buttons/footer_button.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/iterable_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/ozel_hesap_kapatma/view_model/ozel_hesap_kapatma_view_model.dart";

class OzelHesapKapatmaView extends StatefulWidget {
  const OzelHesapKapatmaView({required this.cariModel, super.key});

  final CariListesiModel cariModel;

  @override
  State<OzelHesapKapatmaView> createState() => _OzelHesapKapatmaViewState();
}

class _OzelHesapKapatmaViewState extends BaseState<OzelHesapKapatmaView> {
  final OzelHesapKapatmaViewModel viewModel = OzelHesapKapatmaViewModel();

  @override
  void initState() {
    viewModel
      ..setCari(widget.cariModel)
      ..setBA(widget.cariModel.cariTip == "A" ? "B" : "A");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
    appBar: appBar(),
    body: body(),
    bottomNavigationBar: BottomBarWidget(
      isScrolledDown: true,
      children: [
        FooterButton(
          children: [
            const Text("Seçilen Kapatılmamış Tutar"),
            Observer(
              builder: (_) => Text(
                viewModel.selectedList
                    .map((element) => element.kalanTutar)
                    .sum
                    .commaSeparatedWithDecimalDigits(OndalikEnum.tutar),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    ),
  );

  AppBar appBar() => AppBar(
    title: const AppBarTitle(title: "Özel Hesap Kapatma"),
    actions: [
      IconButton(
        onPressed: () {
          if (viewModel.selectedList.isEmpty) {
            dialogManager.showInfoSnackBar("Özel hesap kapatılacak hareket seçilmedi");
            return;
          }
          dialogManager.showAreYouSureDialog(
            onYes: () async {
              final result = await viewModel.postData();
              if (result.isSuccess) {
                dialogManager.showSuccessSnackBar(result.message ?? "İşlem başarılı");
                Get.back(result: true);
              }
            },
          );
        },
        icon: const Icon(Icons.check_outlined),
      ),
    ],
  );

  Column body() => Column(
    children: [
      Card(
        child: CustomLayoutBuilder.divideInHalf(
          children: [
            Text("Alacak Tutarı: ${widget.cariModel.alacakToplami ?? ""}"),
            Observer(builder: (_) => Text("Kalan Tutar: ${widget.cariModel.alacakToplami ?? ""}")),
            Text("Açıklama: ${widget.cariModel.aciklama1 ?? ""}"),
          ],
        ),
      ),
      Expanded(
        child: Observer(
          builder: (_) => RefreshableListView(
            onRefresh: () async {},
            items: viewModel.observableList,
            itemBuilder: (item) => Card(
              child: Observer(
                builder: (_) => CheckboxListTile.adaptive(
                  value: viewModel.isSelected(item),
                  controlAffinity: ListTileControlAffinity.platform,
                  onChanged: (value) => viewModel.checkSelectedList(value ?? false, item),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item.tarih.toDateString),
                          Wrap(
                            children: [
                              Text("(${item.borcHareketiMi ? "B" : "A"})"),
                              Text(
                                "${item.tutar.abs().commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${item.dovizAdi ?? mainCurrency}",
                              ).paddingOnly(left: UIHelper.lowSize),
                            ],
                          ),
                        ],
                      ),
                      Text(item.aciklama ?? ""),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item.hareketAciklama case final value?)
                        Text(value, style: const TextStyle(color: UIHelper.primaryColor)),
                      Text(
                        "ÖZEL HESAP KAPATMALI CARİ",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.7),
                        ),
                      ),
                      CustomLayoutBuilder.divideInHalf(
                        children: [
                          Text("Belge No: ${item.belgeNo ?? ""}"),
                          if (item.vadeTarihi case final value?) Text("Vade Tarihi: ${value.toDateString}"),
                          if (item.plasiyerAciklama case final value?) Text("Plasiyer: $value"),
                          Text(
                            "Kapatılmış Tutar: ${item.kapatilmisTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}",
                          ),
                          Text("Kalan Tutar: ${item.kalanTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}"),
                        ],
                      ),
                      if (item.aciklama case final value?) ...[
                        const Divider(indent: 0, endIndent: 0).paddingSymmetric(vertical: UIHelper.midSize),
                        Text(value),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
