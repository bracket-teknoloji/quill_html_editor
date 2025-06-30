// To parse this JSON data, do
//
//     final paykerOdemeLinkListesiModel = paykerOdemeLinkListesiModelFromJson(jsonString);

import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_link_edit/model/payker_link_edit_model.dart";

part "payker_odeme_link_listesi_model.freezed.dart";
part "payker_odeme_link_listesi_model.g.dart";

@freezed
@JsonSerializable()
final class PaykerOdemeLinkListesiModel with _$PaykerOdemeLinkListesiModel, NetworkManagerMixin {
  PaykerOdemeLinkListesiModel({
    this.id,
    this.guid,
    this.firmaId,
    this.bayiId,
    this.tutar,
    this.email,
    this.unvan,
    this.alindi,
    this.bittar,
    this.taksitlerJson,
    this.kullanimSayisi,
    this.odemeler,
    this.kayittarihi,
    this.kayityapankul,
    this.duzeltmetarihi,
    this.duzeltmeyapankul,
  });
  factory PaykerOdemeLinkListesiModel.fromJson(Map<String, dynamic> json) =>
      _$PaykerOdemeLinkListesiModelFromJson(json);

  @override
  final int? id;
  @override
  final String? guid;
  @override
  final int? firmaId;
  @override
  final int? bayiId;
  @override
  final int? tutar;
  @override
  final String? email;
  @override
  final String? unvan;
  @override
  final bool? alindi;
  @override
  final DateTime? bittar;
  @override
  final String? taksitlerJson;
  @override
  final int? kullanimSayisi;
  @override
  final List<PaykerOdemeLinkListesiModel>? odemeler;
  @override
  final DateTime? kayittarihi;
  @override
  final String? kayityapankul;
  @override
  final DateTime? duzeltmetarihi;
  @override
  final String? duzeltmeyapankul;

  @override
  NetworkManagerMixin? fromJson(Map<String, dynamic> json) => PaykerOdemeLinkListesiModel.fromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PaykerOdemeLinkListesiModelToJson(this);

  bool get alindiMi => alindi == true;


  String? get url => "${ApiUrls.basePaykerURLWithoutApi}/payment/${guid ?? ""}";

  PaykerLinkEditModel get editModel => PaykerLinkEditModel(
    alindi: alindi,
    guid: guid,
    bayiId: bayiId,
    tutar: tutar?.toDouble(),
    email: email,
    unvan: unvan,
    bitTar: bittar,
    kullanimSayisi: kullanimSayisi,
  );
}
