import "package:json_annotation/json_annotation.dart";

import "../../../../constants/extensions/date_time_extensions.dart";
import "../../../model/base_network_mixin.dart";

part "servis_info_model.g.dart";

@JsonSerializable()
class ServisInfoModel with NetworkManagerMixin {
  ServisInfoModel({
    this.version,
    this.updateDate,
    this.siteName,
    this.assemblyName,
    this.isDebug,
    this.path,
    this.serverTime,
    this.applicationVirtualPath,
    this.serverName,
    this.serverIp,
    this.appPoolName,
    this.netFectWinService,
    this.processId,
  });

  factory ServisInfoModel.fromJson(Map<String, dynamic> json) => _$ServisInfoModelFromJson(json);
  @JsonKey(name: "Version")
  String? version;
  @JsonKey(name: "UpdateDate")
  DateTime? updateDate;
  @JsonKey(name: "SiteName")
  String? siteName;
  @JsonKey(name: "AssemblyName")
  String? assemblyName;
  @JsonKey(name: "IsDebug")
  bool? isDebug;
  @JsonKey(name: "Path")
  String? path;
  @JsonKey(name: "ServerTime")
  String? serverTime;
  @JsonKey(name: "ApplicationVirtualPath")
  String? applicationVirtualPath;
  @JsonKey(name: "ServerName")
  String? serverName;
  @JsonKey(name: "ServerIP")
  String? serverIp;
  @JsonKey(name: "AppPoolName")
  String? appPoolName;
  @JsonKey(name: "NetFectWinService")
  String? netFectWinService;
  @JsonKey(name: "ProcessID")
  int? processId;

  @override
  ServisInfoModel fromJson(Map<String, dynamic> json) => _$ServisInfoModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ServisInfoModelToJson(this);

  String get getInfo => """
Versiyon: ${version ?? ""}
Versiyon Tarihi: ${updateDate?.toDateString ?? ""}
Sunucu Adı: ${serverName ?? ""}
Sunucu IP: ${serverIp ?? ""}
Sunucu Tarihi: ${serverTime ?? ""}
NF Windows Servis Durumu: ${netFectWinService ?? ""}
""";
}
