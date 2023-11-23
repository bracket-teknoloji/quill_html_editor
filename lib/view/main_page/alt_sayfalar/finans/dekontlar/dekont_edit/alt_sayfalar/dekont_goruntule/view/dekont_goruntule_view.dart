import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/dekontlar/dekont_edit/alt_sayfalar/dekont_goruntule/view_model/dekont_goruntule_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/dekontlar/dekont_edit/model/dekont_duzenle_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/dekontlar/model/dekont_listesi_model.dart";

class DekontGoruntuleView extends StatefulWidget {
  final DekontListesiModel model;
  const DekontGoruntuleView({super.key, required this.model});

  @override
  State<DekontGoruntuleView> createState() => _DekontGoruntuleViewState();
}

final class _DekontGoruntuleViewState extends BaseState<DekontGoruntuleView> {
  final DekontGoruntuleViewModel viewModel = DekontGoruntuleViewModel();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData(widget.model);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Dekont Detayı"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: UIHelper.lowPadding.copyWith(top: UIHelper.lowSize / 2, bottom: UIHelper.lowSize / 2, right: UIHelper.lowSize / 2, left: UIHelper.lowSize / 2),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: UIHelper.midSize,
                  mainAxisSpacing: UIHelper.midSize,
                  childAspectRatio: 1.7,
                ),
                itemCount: 5,
                itemBuilder: (context, index) => Card(
                  color: theme.colorScheme.onSecondary,
                  child: Observer(
                    builder: (_) {
                      if (viewModel.dekontMap.isEmpty) {
                        return const Center(child: CircularProgressIndicator.adaptive());
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(viewModel.titleList[index]).paddingAll(UIHelper.lowSize),
                          Divider(endIndent: UIHelper.lowSize, indent: UIHelper.lowSize),
                          Text("${viewModel.dekontMap.values.toList()[index]}").paddingAll(UIHelper.lowSize),
                          // Text("${viewModel.getBilgi(index)} $mainCurrency").paddingAll(UIHelper.lowSize),
                        ],
                      );
                    },
                  ),
                ),
              ),
              const CustomTextField(
                labelText: "İşlem Özeti",
              ),
              Text(
                "Kalemler",
                style: theme.textTheme.titleMedium,
              ).paddingAll(UIHelper.lowSize),
              const Divider(indent: 0, endIndent: 0).paddingAll(UIHelper.lowSize),
              ListView.builder(
                itemCount: viewModel.dekontListesi.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
                            Text("Tutar:\n${item.tutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}"),
                            Text("Döviz Tutarı:\n${item.dovizTutari.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)}").yetkiVarMi(item.dovizliMi),
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
              // CustomWidgetWithLabel(text: "Kalemler", child: ListView()),
            ],
          ).paddingAll(UIHelper.lowSize),
        ),
      );
}
