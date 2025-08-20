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
  'Platform': ?instance.platform,
  'AppName': ?instance.appName,
  'AppVersion': ?instance.appVersion,
  'AppBuildNumber': ?instance.appBuildNumber,
  'DeviceModel': ?instance.deviceModel,
  'OsVersion': ?instance.osVersion,
  'DeviceId': ?instance.deviceId,
  'IPAddress': ?instance.iPAddress,
  'Language': ?instance.language,
  'Timezone': ?instance.timezone,
  'Country': ?instance.country,
  'Location': ?instance.location,
  'Browser': ?instance.browser,
  'BrowserVersion': ?instance.browserVersion,
  'Environment': ?instance.environment,
  'Referrer': ?instance.referrer,
  'SessionId': ?instance.sessionId,
  'ClientType': ?instance.clientType,
  'ExternalClientName': ?instance.externalClientName,
};
