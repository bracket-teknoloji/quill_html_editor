// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servis_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServisInfoModel _$ServisInfoModelFromJson(Map<String, dynamic> json) => ServisInfoModel(
  version: json['Version'] as String?,
  updateDate: json['UpdateDate'] == null ? null : DateTime.parse(json['UpdateDate'] as String),
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

Map<String, dynamic> _$ServisInfoModelToJson(ServisInfoModel instance) => <String, dynamic>{
  if (instance.version case final value?) 'Version': value,
  if (instance.updateDate?.toIso8601String() case final value?) 'UpdateDate': value,
  if (instance.siteName case final value?) 'SiteName': value,
  if (instance.assemblyName case final value?) 'AssemblyName': value,
  if (instance.isDebug case final value?) 'IsDebug': value,
  if (instance.path case final value?) 'Path': value,
  if (instance.serverTime case final value?) 'ServerTime': value,
  if (instance.applicationVirtualPath case final value?) 'ApplicationVirtualPath': value,
  if (instance.serverName case final value?) 'ServerName': value,
  if (instance.serverIp case final value?) 'ServerIP': value,
  if (instance.appPoolName case final value?) 'AppPoolName': value,
  if (instance.netFectWinService case final value?) 'NetFectWinService': value,
  if (instance.processId case final value?) 'ProcessID': value,
};
