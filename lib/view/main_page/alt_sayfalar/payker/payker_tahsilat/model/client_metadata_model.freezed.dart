// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_metadata_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClientMetadataModel {

/// İstemci platformu (örn. Android, iOS, Web, Desktop)
 String? get platform;/// İstemci uygulama adı (örn: MyMobileApp, AdminPanel)
 String? get appName;/// Uygulama versiyonu (örn: 1.2.3)
 String? get appVersion;/// Uygulama build numarası (örn: 12345)
 String? get appBuildNumber;/// Cihaz modeli (örn: iPhone 15 Pro, Samsung Galaxy S23)
 String? get deviceModel;/// Cihaz işletim sistemi versiyonu (örn: iOS 17.1, Android 14)
 String? get osVersion;/// Cihazın benzersiz ID'si (örn: UUID, IMEI, DeviceId)
 String? get deviceId;/// Client IP adresi (opsiyonel, middleware'den okunabilir)
 String? get iPAddress;/// Kullanıcının dili (örn: tr-TR, en-US)
 String? get language;/// Timezone bilgisi (örn: Europe/Istanbul)
 String? get timezone;/// Ülke bilgisi (örn: TR, US)
 String? get country;/// Lokasyon bilgisi (örn: GPS koordinatları ya da şehir adı)
 String? get location;/// Tarayıcı adı (Web client ise — Chrome, Firefox vs.)
 String? get browser;/// Tarayıcı versiyonu
 String? get browserVersion;/// Ortam bilgisi (örn: Production, Staging, Test, Local)
 String? get environment;/// Referans kaynağı (örn: hangi sayfa ya da uygulama üzerinden çağırıldı)
 String? get referrer;/// JWT Token ID veya Session ID (isteğe bağlı)
 String? get sessionId;/// İstek yapan istemcinin tipini belirtir (örn: MobileApp, WebApp, APIClient)
 String? get clientType;/// 3rd party client adı (jenerik API consumer’lar için)
 String? get externalClientName;
/// Create a copy of ClientMetadataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientMetadataModelCopyWith<ClientMetadataModel> get copyWith => _$ClientMetadataModelCopyWithImpl<ClientMetadataModel>(this as ClientMetadataModel, _$identity);

  /// Serializes this ClientMetadataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientMetadataModel&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.appBuildNumber, appBuildNumber) || other.appBuildNumber == appBuildNumber)&&(identical(other.deviceModel, deviceModel) || other.deviceModel == deviceModel)&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.iPAddress, iPAddress) || other.iPAddress == iPAddress)&&(identical(other.language, language) || other.language == language)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.country, country) || other.country == country)&&(identical(other.location, location) || other.location == location)&&(identical(other.browser, browser) || other.browser == browser)&&(identical(other.browserVersion, browserVersion) || other.browserVersion == browserVersion)&&(identical(other.environment, environment) || other.environment == environment)&&(identical(other.referrer, referrer) || other.referrer == referrer)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.clientType, clientType) || other.clientType == clientType)&&(identical(other.externalClientName, externalClientName) || other.externalClientName == externalClientName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,platform,appName,appVersion,appBuildNumber,deviceModel,osVersion,deviceId,iPAddress,language,timezone,country,location,browser,browserVersion,environment,referrer,sessionId,clientType,externalClientName]);



}

/// @nodoc
abstract mixin class $ClientMetadataModelCopyWith<$Res>  {
  factory $ClientMetadataModelCopyWith(ClientMetadataModel value, $Res Function(ClientMetadataModel) _then) = _$ClientMetadataModelCopyWithImpl;
@useResult
$Res call({
 String? platform, String? appName, String? appVersion, String? appBuildNumber, String? deviceModel, String? osVersion, String? deviceId, String? iPAddress, String? language, String? timezone, String? country, String? location, String? browser, String? browserVersion, String? environment, String? referrer, String? sessionId, String? clientType, String? externalClientName
});




}
/// @nodoc
class _$ClientMetadataModelCopyWithImpl<$Res>
    implements $ClientMetadataModelCopyWith<$Res> {
  _$ClientMetadataModelCopyWithImpl(this._self, this._then);

  final ClientMetadataModel _self;
  final $Res Function(ClientMetadataModel) _then;

/// Create a copy of ClientMetadataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? platform = freezed,Object? appName = freezed,Object? appVersion = freezed,Object? appBuildNumber = freezed,Object? deviceModel = freezed,Object? osVersion = freezed,Object? deviceId = freezed,Object? iPAddress = freezed,Object? language = freezed,Object? timezone = freezed,Object? country = freezed,Object? location = freezed,Object? browser = freezed,Object? browserVersion = freezed,Object? environment = freezed,Object? referrer = freezed,Object? sessionId = freezed,Object? clientType = freezed,Object? externalClientName = freezed,}) {
  return _then(_self.copyWith(
platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String?,appName: freezed == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String?,appVersion: freezed == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String?,appBuildNumber: freezed == appBuildNumber ? _self.appBuildNumber : appBuildNumber // ignore: cast_nullable_to_non_nullable
as String?,deviceModel: freezed == deviceModel ? _self.deviceModel : deviceModel // ignore: cast_nullable_to_non_nullable
as String?,osVersion: freezed == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String?,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,iPAddress: freezed == iPAddress ? _self.iPAddress : iPAddress // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,browser: freezed == browser ? _self.browser : browser // ignore: cast_nullable_to_non_nullable
as String?,browserVersion: freezed == browserVersion ? _self.browserVersion : browserVersion // ignore: cast_nullable_to_non_nullable
as String?,environment: freezed == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as String?,referrer: freezed == referrer ? _self.referrer : referrer // ignore: cast_nullable_to_non_nullable
as String?,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,clientType: freezed == clientType ? _self.clientType : clientType // ignore: cast_nullable_to_non_nullable
as String?,externalClientName: freezed == externalClientName ? _self.externalClientName : externalClientName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.pascal)
class _ClientMetadataModel implements ClientMetadataModel {
  const _ClientMetadataModel({this.platform, this.appName, this.appVersion, this.appBuildNumber, this.deviceModel, this.osVersion, this.deviceId, this.iPAddress, this.language, this.timezone, this.country, this.location, this.browser, this.browserVersion, this.environment, this.referrer, this.sessionId, this.clientType, this.externalClientName});
  factory _ClientMetadataModel.fromJson(Map<String, dynamic> json) => _$ClientMetadataModelFromJson(json);

/// İstemci platformu (örn. Android, iOS, Web, Desktop)
@override final  String? platform;
/// İstemci uygulama adı (örn: MyMobileApp, AdminPanel)
@override final  String? appName;
/// Uygulama versiyonu (örn: 1.2.3)
@override final  String? appVersion;
/// Uygulama build numarası (örn: 12345)
@override final  String? appBuildNumber;
/// Cihaz modeli (örn: iPhone 15 Pro, Samsung Galaxy S23)
@override final  String? deviceModel;
/// Cihaz işletim sistemi versiyonu (örn: iOS 17.1, Android 14)
@override final  String? osVersion;
/// Cihazın benzersiz ID'si (örn: UUID, IMEI, DeviceId)
@override final  String? deviceId;
/// Client IP adresi (opsiyonel, middleware'den okunabilir)
@override final  String? iPAddress;
/// Kullanıcının dili (örn: tr-TR, en-US)
@override final  String? language;
/// Timezone bilgisi (örn: Europe/Istanbul)
@override final  String? timezone;
/// Ülke bilgisi (örn: TR, US)
@override final  String? country;
/// Lokasyon bilgisi (örn: GPS koordinatları ya da şehir adı)
@override final  String? location;
/// Tarayıcı adı (Web client ise — Chrome, Firefox vs.)
@override final  String? browser;
/// Tarayıcı versiyonu
@override final  String? browserVersion;
/// Ortam bilgisi (örn: Production, Staging, Test, Local)
@override final  String? environment;
/// Referans kaynağı (örn: hangi sayfa ya da uygulama üzerinden çağırıldı)
@override final  String? referrer;
/// JWT Token ID veya Session ID (isteğe bağlı)
@override final  String? sessionId;
/// İstek yapan istemcinin tipini belirtir (örn: MobileApp, WebApp, APIClient)
@override final  String? clientType;
/// 3rd party client adı (jenerik API consumer’lar için)
@override final  String? externalClientName;

/// Create a copy of ClientMetadataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientMetadataModelCopyWith<_ClientMetadataModel> get copyWith => __$ClientMetadataModelCopyWithImpl<_ClientMetadataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientMetadataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientMetadataModel&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.appBuildNumber, appBuildNumber) || other.appBuildNumber == appBuildNumber)&&(identical(other.deviceModel, deviceModel) || other.deviceModel == deviceModel)&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.iPAddress, iPAddress) || other.iPAddress == iPAddress)&&(identical(other.language, language) || other.language == language)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.country, country) || other.country == country)&&(identical(other.location, location) || other.location == location)&&(identical(other.browser, browser) || other.browser == browser)&&(identical(other.browserVersion, browserVersion) || other.browserVersion == browserVersion)&&(identical(other.environment, environment) || other.environment == environment)&&(identical(other.referrer, referrer) || other.referrer == referrer)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.clientType, clientType) || other.clientType == clientType)&&(identical(other.externalClientName, externalClientName) || other.externalClientName == externalClientName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,platform,appName,appVersion,appBuildNumber,deviceModel,osVersion,deviceId,iPAddress,language,timezone,country,location,browser,browserVersion,environment,referrer,sessionId,clientType,externalClientName]);



}

/// @nodoc
abstract mixin class _$ClientMetadataModelCopyWith<$Res> implements $ClientMetadataModelCopyWith<$Res> {
  factory _$ClientMetadataModelCopyWith(_ClientMetadataModel value, $Res Function(_ClientMetadataModel) _then) = __$ClientMetadataModelCopyWithImpl;
@override @useResult
$Res call({
 String? platform, String? appName, String? appVersion, String? appBuildNumber, String? deviceModel, String? osVersion, String? deviceId, String? iPAddress, String? language, String? timezone, String? country, String? location, String? browser, String? browserVersion, String? environment, String? referrer, String? sessionId, String? clientType, String? externalClientName
});




}
/// @nodoc
class __$ClientMetadataModelCopyWithImpl<$Res>
    implements _$ClientMetadataModelCopyWith<$Res> {
  __$ClientMetadataModelCopyWithImpl(this._self, this._then);

  final _ClientMetadataModel _self;
  final $Res Function(_ClientMetadataModel) _then;

/// Create a copy of ClientMetadataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? platform = freezed,Object? appName = freezed,Object? appVersion = freezed,Object? appBuildNumber = freezed,Object? deviceModel = freezed,Object? osVersion = freezed,Object? deviceId = freezed,Object? iPAddress = freezed,Object? language = freezed,Object? timezone = freezed,Object? country = freezed,Object? location = freezed,Object? browser = freezed,Object? browserVersion = freezed,Object? environment = freezed,Object? referrer = freezed,Object? sessionId = freezed,Object? clientType = freezed,Object? externalClientName = freezed,}) {
  return _then(_ClientMetadataModel(
platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String?,appName: freezed == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String?,appVersion: freezed == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String?,appBuildNumber: freezed == appBuildNumber ? _self.appBuildNumber : appBuildNumber // ignore: cast_nullable_to_non_nullable
as String?,deviceModel: freezed == deviceModel ? _self.deviceModel : deviceModel // ignore: cast_nullable_to_non_nullable
as String?,osVersion: freezed == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String?,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,iPAddress: freezed == iPAddress ? _self.iPAddress : iPAddress // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,browser: freezed == browser ? _self.browser : browser // ignore: cast_nullable_to_non_nullable
as String?,browserVersion: freezed == browserVersion ? _self.browserVersion : browserVersion // ignore: cast_nullable_to_non_nullable
as String?,environment: freezed == environment ? _self.environment : environment // ignore: cast_nullable_to_non_nullable
as String?,referrer: freezed == referrer ? _self.referrer : referrer // ignore: cast_nullable_to_non_nullable
as String?,sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,clientType: freezed == clientType ? _self.clientType : clientType // ignore: cast_nullable_to_non_nullable
as String?,externalClientName: freezed == externalClientName ? _self.externalClientName : externalClientName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
