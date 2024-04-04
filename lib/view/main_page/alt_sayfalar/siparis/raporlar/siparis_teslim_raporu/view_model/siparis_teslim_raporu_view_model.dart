import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../../../../../../core/constants/enum/edit_tipi_enum.dart";

part "siparis_teslim_raporu_view_model.g.dart";

class SiparisTeslimRaporuViewModel = _SiparisTeslimRaporuViewModelBase with _$SiparisTeslimRaporuViewModel;

abstract class _SiparisTeslimRaporuViewModelBase with Store {
  _SiparisTeslimRaporuViewModelBase(EditTipiEnum siparisTipi) {
    editTipiEnum = siparisTipi;
    pdfModel.dicParams?.belgeTipi = editTipiEnum?.rawValue;
  }
  //* Model
  //*

  static EditTipiEnum? editTipiEnum = EditTipiEnum.musteri;
  @observable
  PdfModel pdfModel = PdfModel(
    raporOzelKod: editTipiEnum.musteriMi ? "Rapor_SiparisMSTeslim" : "Rapor_SiparisSSTeslim",
    standart: true,
    dicParams: DicParams(),
  );
  @observable
  bool kapaliMi = false;
  @observable
  bool durum = false;

  @action
  void setStokKodu(String? value) => pdfModel.dicParams = pdfModel.dicParams?.copyWith(stokKodu: value);
  @action
  void setCariKodu(String? value) => pdfModel.dicParams = pdfModel.dicParams?.copyWith(cariKodu: value);
  @action
  void setBelgeNo(String? value) => pdfModel.dicParams = pdfModel.dicParams?.copyWith(belgeNo: value);
  @action
  void setVergiNo(String? value) => pdfModel.dicParams = pdfModel.dicParams?.copyWith(vergiNo: value);
  @action
  void setKapali(String? value) {
    kapaliMi = value == "E";
    pdfModel.dicParams = pdfModel.dicParams?.copyWith(kapali: value);
  }

  @action
  void setDurum(String? value) {
    durum = value != null;
    pdfModel.dicParams = pdfModel.dicParams?.copyWith(durum: value);
  }

  @action
  void setBaslangicTarihi(String? value) => pdfModel.dicParams = pdfModel.dicParams?.copyWith(bastar: value);
  @action
  void setBitisTarihi(String? value) => pdfModel.dicParams = pdfModel.dicParams?.copyWith(bittar: value);
  //* Future
  //*
  @observable
  ObservableFuture<bool?> futureController = ObservableFuture(Future.error(false));

  @action
  void setFuture() => futureController = ObservableFuture.value(true);

  @action
  void resetFuture() => futureController = ObservableFuture.value(false);
}
