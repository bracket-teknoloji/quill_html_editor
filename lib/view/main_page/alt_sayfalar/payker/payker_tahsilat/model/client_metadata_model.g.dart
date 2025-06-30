// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_metadata_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClientMetadataModel _$ClientMetadataModelFromJson(Map<String, dynamic> json) =>
    _ClientMetadataModel(
      platform: json['Platform'] as String?,
      appName: json['AppName'] as String?,
      appVersion: json['AppVersion'] as String?,
      appBuildNumber: json['AppBuildNumber'] as String?,
      deviceModel: json['DeviceModel'] as String?,
      osVersion: json['OsVersion'] as String?,
      deviceId: json['DeviceId'] as String?,
      iPAddress: json['IPAddress'] as String?,
      language: json['Language'] as String?,
      timezone: json['Timezone'] as String?,
      country: json['Country'] as String?,
      location: json['Location'] as String?,
      browser: json['Browser'] as String?,
      browserVersion: json['BrowserVersion'] as String?,
      environment: json['Environment'] as String?,
      referrer: json['Referrer'] as String?,
      sessionId: json['SessionId'] as String?,
      clientType: json['ClientType'] as String?,
      externalClientName: json['ExternalClientName'] as String?,
    );

Map<String, dynamic> _$ClientMetadataModelToJson(
  _ClientMetadataModel instance,
) => <String, dynamic>{
  if (instance.platform case final value?) 'Platform': value,
  if (instance.appName case final value?) 'AppName': value,
  if (instance.appVersion case final value?) 'AppVersion': value,
  if (instance.appBuildNumber case final value?) 'AppBuildNumber': value,
  if (instance.deviceModel case final value?) 'DeviceModel': value,
  if (instance.osVersion case final value?) 'OsVersion': value,
  if (instance.deviceId case final value?) 'DeviceId': value,
  if (instance.iPAddress case final value?) 'IPAddress': value,
  if (instance.language case final value?) 'Language': value,
  if (instance.timezone case final value?) 'Timezone': value,
  if (instance.country case final value?) 'Country': value,
  if (instance.location case final value?) 'Location': value,
  if (instance.browser case final value?) 'Browser': value,
  if (instance.browserVersion case final value?) 'BrowserVersion': value,
  if (instance.environment case final value?) 'Environment': value,
  if (instance.referrer case final value?) 'Referrer': value,
  if (instance.sessionId case final value?) 'SessionId': value,
  if (instance.clientType case final value?) 'ClientType': value,
  if (instance.externalClientName case final value?)
    'ExternalClientName': value,
};
