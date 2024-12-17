import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../../core/constants/extensions/list_extensions.dart";
import "../../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../model/dekont_listesi_model.dart";
import "../../../model/dekont_duzenle_request_model.dart";
import "../view_model/dekont_goruntule_view_model.dart";

class DekontGoruntuleView extends StatefulWidget {
  const DekontGoruntuleView({super.key, this.model, this.refKey});
  final DekontListesiModel? model;
  final String? refKey;

  @override
  State<DekontGoruntuleView> createState() => _DekontGoruntuleViewState();
}

final class _DekontGoruntuleViewState extends BaseState<DekontGoruntuleView> {
  final DekontGoruntuleViewModel viewModel = DekontGoruntuleViewModel();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData(widget.model, widget.refKey);
      if (widget.refKey != null) {
        await viewModel.getData(DekontListesiModel.fromDekontDuzenleRequestModel(viewModel.dekontListesi.first), null);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: AppBar(
          title: const AppBarTitle(title: "Dekont Detayı"),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: UIHelper.lowPadding.copyWith(top: UIHelper.lowSize / 2, bottom: UIHelper.lowSize / 2, right: UIHelper.lowSize / 2, left: UIHelper.lowSize / 2),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: UIHelper.midSize,
                mainAxisSpacing: UIHelper.midSize,
                childAspectRatio: context.isLandscape ? 3 : 1.7,
              ),
              itemCount: 5,
              itemBuilder: (context, index) => Card(
                color: theme.colorScheme.onSecondary,
                child: Observer(
                  builder: (_) {
                    if (viewModel.dekontMap?.isEmpty ?? true) {
                      return const Center(child: CircularProgressIndicator.adaptive());
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(viewModel.titleList[index]).paddingAll(UIHelper.lowSize),
                        const Divider(endIndent: UIHelper.lowSize, indent: UIHelper.lowSize),
                        Text("${viewModel.dekontMap?.values.toList()[index]}").paddingAll(UIHelper.lowSize),
                        // Text("${viewModel.getBilgi(index)} $mainCurrency").paddingAll(UIHelper.lowSize),
                      ],
                    );
                  },
                ),
              ),
            ),
            const Divider(indent: 0, endIndent: 0).paddingAll(UIHelper.lowSize),
            CustomWidgetWithLabel(
              text: "İşlem Özeti",
              child: Card(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Observer(
                    builder: (_) => Wrap(
                      children: List.generate(
                        viewModel.dekontListesi.length,
                        (index) {
                          final item = viewModel.dekontListesi[index];
                          return Row(
                            children: [
                              Text(item.hesapAdi ?? "", maxLines: 1),
                              if (index != viewModel.dekontListesi.length - 1)
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: UIHelper.highSize,
                                ),
                              if (index != viewModel.dekontListesi.length - 1) Text("${item.tutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                              if (index != viewModel.dekontListesi.length - 1)
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: UIHelper.highSize,
                                ),
                            ],
                          ).paddingAll(UIHelper.lowSize);
                        },
                      ).nullCheckWithGeneric,
                    ),
                  ),
                ).paddingSymmetric(vertical: UIHelper.lowSize),
              ),
            ),
            const Divider(indent: 0, endIndent: 0).paddingAll(UIHelper.lowSize),
            Observer(
              builder: (_) => Text(
                "Kalemler (${viewModel.dekontListesi.length})",
              ).paddingAll(UIHelper.lowSize),
            ),
            // const Divider(indent: 0, endIndent: 0).paddingAll(UIHelper.lowSize),
            Expanded(
              child: Observer(
                builder: (_) => ListView.builder(
                  itemCount: viewModel.dekontListesi.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = viewModel.dekontListesi[index];
                    return Card(
                      child: ListTile(
                        title: LayoutBuilder(
                          builder: (context, constraints) => Wrap(
                            children: [
                              Text("Tarih:\n${item.tarih.toDateString}"),
                              Text("Borç/Alacak:\n${item.ba ?? ""}"),
                              Text("Sıra:\n${item.siraNo ?? ""}"),
                              Text("Hesap Tipi:\n${item.hesapTipi ?? ""}"),
                              Text("Hesap Kodu:\n${item.hesapKodu ?? ""}"),
                              Text("Tutar:\n${item.tutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                              Text("Döviz Tutarı:\n${item.dovizTutari.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)} ${item.dovizAdi ?? ""}").yetkiVarMi(item.dovizliMi),
                              Text("Kur:\n${item.dovizKuru.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(item.dovizliMi),
                              Text("Plasiyer:\n${item.plasiyerAciklama ?? ""}"),
                            ].map((e) => e is SizedBox ? null : SizedBox(width: constraints.maxWidth / 3, child: e)).toList().nullCheckWithGeneric,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hesap Adı:\n${item.hesapAdi ?? ""}"),
                            Text("Açıklama:\n${item.aciklama ?? ""}").paddingOnly(top: UIHelper.lowSize),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // CustomWidgetWithLabel(text: "Kalemler", child: ListView()),
          ],
        ).paddingAll(UIHelper.lowSize),
      );
}
