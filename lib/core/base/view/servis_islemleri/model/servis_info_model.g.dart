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

Map<String, dynamic> _$ServisInfoModelToJson(ServisInfoModel instance) =>
    <String, dynamic>{
      'Version': ?instance.version,
      'UpdateDate': ?instance.updateDate?.toIso8601String(),
      'SiteName': ?instance.siteName,
      'AssemblyName': ?instance.assemblyName,
      'IsDebug': ?instance.isDebug,
      'Path': ?instance.path,
      'ServerTime': ?instance.serverTime,
      'ApplicationVirtualPath': ?instance.applicationVirtualPath,
      'ServerName': ?instance.serverName,
      'ServerIP': ?instance.serverIp,
      'AppPoolName': ?instance.appPoolName,
      'NetFectWinService': ?instance.netFectWinService,
      'ProcessID': ?instance.processId,
    };
