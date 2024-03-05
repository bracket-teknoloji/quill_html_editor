import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../../../core/base/model/tahsilat_request_model.dart";
import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../cari/cari_listesi/model/cari_request_model.dart";
import "../../../../e_belge/e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";
import "../../model/dekont_listesi_model.dart";
import "../alt_sayfalar/genel/view/dekont_edit_genel_view.dart";
import "../alt_sayfalar/kalemler/view/dekont_edit_kalemler_view.dart";
import "../model/dekont_islemler_request_model.dart";
import "../view_model/dekont_edit_view_model.dart";

class DekontEditView extends StatefulWidget {
  final BaseEditEnum baseEditEnum;
  final DekontListesiModel? model;
  final EBelgeListesiModel? eBelgeModel;
  const DekontEditView({super.key, required this.baseEditEnum, this.model, this.eBelgeModel});

  @override
  State<DekontEditView> createState() => _DekontEditViewState();
}

class _DekontEditViewState extends BaseState<DekontEditView> with SingleTickerProviderStateMixin {
  final DekontEditViewModel viewModel = DekontEditViewModel();
  late final TabController _tabController;

  @override
  void initState() {
    SingletonDekontIslemlerRequestModel.setInstance(DekontIslemlerRequestModel());
    if (widget.baseEditEnum == BaseEditEnum.ekle) {
      SingletonDekontIslemlerRequestModel.instance.yeniKayit = true;
      SingletonDekontIslemlerRequestModel.instance.dekontIslemTuru = "DSG";
      viewModel.setIslemTamamlandi(true);
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.baseEditEnum == BaseEditEnum.duzenle) {
        await viewModel.getData(widget.model!);
        SingletonDekontIslemlerRequestModel.instance.dekontIslemTuru = "DSG";
      } else if (widget.baseEditEnum == BaseEditEnum.taslak) {
        final EBelgeListesiModel model = widget.eBelgeModel!;
        final CariListesiModel? cariModel = await networkManager.getCariModel(CariRequestModel(vergiNo: model.vergiNo, plasiyerKisitiYok: true, filterText: "", eFaturaGoster: true, kod: [""]));
        SingletonDekontIslemlerRequestModel.instance.yeniKayit = true;
        SingletonDekontIslemlerRequestModel.instance.dekontIslemTuru = "DSG";
        SingletonDekontIslemlerRequestModel.instance.tarih = DateTime.now().dateTimeWithoutTime;

        SingletonDekontIslemlerRequestModel.instance.kalemler = [
          DekontKalemler(
            hesapTipi: "C",
            ba: "A",
            hesapAdi: cariModel?.cariAdi,
            hesapKodu: cariModel?.cariKodu,
            kalemAdi: model.cariAdi,
            tutar: model.genelToplam,
            belgeNo: model.resmiBelgeNo,
            hesapTipiAciklama: "Cari",
            aciklama: "E-Faturadan Dekont İşlemi",
            plasiyerAciklama: cariModel?.plasiyerAciklama,
            plasiyerKodu: cariModel?.plasiyerKodu,
          ),
          DekontKalemler(
            hesapTipi: "M",
            ba: "B",
            hesapAdi: "Muhasebe Kodu Seçiniz",
            hesapKodu: cariModel?.cariKodu,
            kalemAdi: "Muhasebe Kodu Seçiniz",
            tutar: (model.genelToplam ?? 0) - (model.kdvTutari ?? 0),
            belgeNo: model.resmiBelgeNo,
            hesapTipiAciklama: "Muhasebe",
            aciklama: "E-Faturadan Dekont İşlemi",
            plasiyerAciklama: cariModel?.plasiyerAciklama,
            plasiyerKodu: cariModel?.plasiyerKodu,
          ),
          DekontKalemler(
            hesapTipi: "M",
            ba: "B",
            hesapAdi: "Muhasebe Kodu Seçiniz",
            hesapKodu: cariModel?.cariKodu,
            kalemAdi: "Muhasebe Kodu Seçiniz",
            tutar: model.kdvTutari,
            belgeNo: model.resmiBelgeNo,
            hesapTipiAciklama: "Muhasebe",
            aciklama: "E-Faturadan Dekont İşlemi",
            plasiyerAciklama: cariModel?.plasiyerAciklama,
            plasiyerKodu: cariModel?.plasiyerKodu,
          ),
        ];
        viewModel.setKalemSayisi(SingletonDekontIslemlerRequestModel.instance.kalemler?.length ?? 0);
        viewModel.setIslemTamamlandi(true);
      }
    });
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (!SingletonDekontIslemlerRequestModel.instance.ilkSayfaTamamMi) {
        dialogManager.showErrorSnackBar("Genel bilgileri doldurun.");
        _tabController.animateTo(0);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: false,
        onPopInvoked: (value) async {
          if (value) {
            return;
          }
          await dialogManager.showAreYouSureDialog(Get.back);
        },
        child: Scaffold(
          appBar: AppBar(
            title: AppBarTitle(
              title: "Genel Dekont",
              subtitle: widget.baseEditEnum.name,
            ),
            actions: [
              saveButton,
            ],
            bottom: TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: loc.generalStrings.general),
                Tab(
                  child: Observer(
                    builder: (_) => Text("Kalemler (${viewModel.kalemSayisi})"),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Observer(
                builder: (_) {
                  if (!viewModel.islemTamamlandi) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  return DekontEditGenelView(
                    baseEditEnum: widget.baseEditEnum,
                    onChanged: (value) {},
                  );
                },
              ),
              DekontEditKalemlerView(
                baseEditEnum: widget.baseEditEnum,
                onChanged: viewModel.setKalemSayisi,
              ),
            ],
          ),
        ),
      );

  IconButton get saveButton => IconButton(
        onPressed: () async {
          if (SingletonDekontIslemlerRequestModel.instance.toplamAlacak.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) !=
              SingletonDekontIslemlerRequestModel.instance.toplamBorc.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)) {
            dialogManager.showErrorSnackBar("Alacak ve Borç eşit olmalıdır.");
          } else if (SingletonDekontIslemlerRequestModel.instance.kalemler.ext.isNullOrEmpty) {
            dialogManager.showErrorSnackBar("Kalem ekleyin.");
            _tabController.animateTo(1);
          } else {
            final result = await viewModel.postData();
            if (result.success ?? false) {
              dialogManager.showSuccessSnackBar("İşlem Başarılı");
              Get.back();
            }
          }
        },
        icon: const Icon(Icons.save_outlined),
      );
}
