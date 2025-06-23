import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_odeme_link_listesi/view_model/payker_odeme_link_listesi_view_model.dart";

class PaykerOdemeLinkListesiView extends StatefulWidget {
  const PaykerOdemeLinkListesiView({super.key});

  @override
  State<PaykerOdemeLinkListesiView> createState() => _PaykerOdemeLinkListesiViewState();
}

class _PaykerOdemeLinkListesiViewState extends BaseState<PaykerOdemeLinkListesiView> {
  final PaykerOdemeLinkListesiViewModel _viewModel = PaykerOdemeLinkListesiViewModel();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final result = await _viewModel.checkPermissions();
      // eğer result'ın kayıtTarihi geçtiğimiz 7 günden daha eskiyse, verileri güncelle
      if (result == null) {
        dialogManager.showAlertDialog(
          "Payker Ödeme Listesi verilerine erişim izni verilmedi.",
        );
        Get.back();
        return;
      }
      if (result.paykerModule == null) {
        dialogManager.showAlertDialog(
          "Payker modülü bulunamadı. Lütfen Payker modülünü etkinleştirin.",
        );
        Get.back();
        return;
      }
      if (!(result.paykerModule!.sozlesmeAktif ?? false)) {
        dialogManager.showAlertDialog(
          "Payker modülü sözleşmesi aktif değil. Lütfen sözleşmeyi kontrol edin.",
        );
        Get.back();
        return;
      }
      if (result.kayitTarihi != null && result.kayitTarihi!.isAfter(DateTime.now().subtract(const Duration(days: 7)))) {
        await _viewModel.getData();
      } else {
        return dialogManager.showAlertDialog(
          "Payker Ödeme Listesi verileri güncel değil. Lütfen verileri güncelleyin.",
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const AppBarTitle(title: "Ödeme Linkleri"),
    ),
    body: Observer(
      builder: (_) => RefreshableListView(
        onRefresh: _viewModel.getData,
        items: _viewModel.observableList,
        itemBuilder: (item) => Card(
          child: ListTile(
            title: Text(item.id.toStringIfNotNull ?? "", style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomLayoutBuilder.divideInHalf(
                  children: [
                    Text("Firma ID: ${item.firmaId ?? ""}"),
                    Text("Bayi ID: ${item.bayiId ?? ""}"),
                    Text("Tutar: ${item.tutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                    Text("Unvan: ${item.unvan ?? ""}"),
                    Text("Alındı: ${item.alindi ?? false}"),
                    Text("Bitiş Tarihi: ${item.bittar?.toDateString ?? ""}"),
                    Text("Kullanım Sayısı: ${item.kullanimSayisi ?? ""}"),
                  ],
                ),

                Text("Email: ${item.email ?? ""}"),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
