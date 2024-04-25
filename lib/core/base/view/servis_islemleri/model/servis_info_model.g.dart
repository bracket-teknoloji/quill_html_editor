// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servis_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServisInfoModel _$ServisInfoModelFromJson(Map<String, dynamic> json) =>
    ServisInfoModel(
      version: json['Version'] as String?,
      updateDate: json['UpdateDate'] == null
          ? null
          : DateTime.parse(json['UpdateDate'] as String),
      siteName: json['SiteName'] as String?,
      assemblyName: json['AssemblyName'] as String?,
      isDebug: json['IsDebug'] as bool?,
      path: json['Path'] as String?,
      serverTime: json['ServerTime'] as String?,
      applicationVirtualPath: json['ApplicationVirtualPath'] as String?,
      serverName: json['ServerName'] as String?,
      serverIp: json['ServerIP'] as String?,
      appPoolName: json['AppPoolName'] as String?,
      netFectWinService: json['NetFectWinService'] as String?,
      processId: (json['ProcessID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ServisInfoModelToJson(ServisInfoModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Version', instance.version);
  writeNotNull('UpdateDate', instance.updateDate?.toIso8601String());
  writeNotNull('SiteName', instance.siteName);
  writeNotNull('AssemblyName', instance.assemblyName);
  writeNotNull('IsDebug', instance.isDebug);
  writeNotNull('Path', instance.path);
  writeNotNull('ServerTime', instance.serverTime);
  writeNotNull('ApplicationVirtualPath', instance.applicationVirtualPath);
  writeNotNull('ServerName', instance.serverName);
  writeNotNull('ServerIP', instance.serverIp);
  writeNotNull('AppPoolName', instance.appPoolName);
  writeNotNull('NetFectWinService', instance.netFectWinService);
  writeNotNull('ProcessID', instance.processId);
  return val;
}
