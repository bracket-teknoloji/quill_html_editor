import "package:freezed_annotation/freezed_annotation.dart";
import "package:picker/core/init/app_info/app_info.dart";
import "package:picker/view/add_company/model/account_model.dart";

part "client_metadata_model.freezed.dart";
part "client_metadata_model.g.dart"; // JSON serileştirme/deserileştirme için

@freezed
sealed class ClientMetadataModel with _$ClientMetadataModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory ClientMetadataModel({
    /// İstemci platformu (örn. Android, iOS, Web, Desktop)
    String? platform,

    /// İstemci uygulama adı (örn: MyMobileApp, AdminPanel)
    String? appName,

    /// Uygulama versiyonu (örn: 1.2.3)
    String? appVersion,

    /// Uygulama build numarası (örn: 12345)
    String? appBuildNumber,

    /// Cihaz modeli (örn: iPhone 15 Pro, Samsung Galaxy S23)
    String? deviceModel,

    /// Cihaz işletim sistemi versiyonu (örn: iOS 17.1, Android 14)
    String? osVersion,

    /// Cihazın benzersiz ID'si (örn: UUID, IMEI, DeviceId)
    String? deviceId,

    /// Client IP adresi (opsiyonel, middleware'den okunabilir)
    String? iPAddress,

    /// Kullanıcının dili (örn: tr-TR, en-US)
    String? language,

    /// Timezone bilgisi (örn: Europe/Istanbul)
    String? timezone,

    /// Ülke bilgisi (örn: TR, US)
    String? country,

    /// Lokasyon bilgisi (örn: GPS koordinatları ya da şehir adı)
    String? location,

    /// Tarayıcı adı (Web client ise — Chrome, Firefox vs.)
    String? browser,

    /// Tarayıcı versiyonu
    String? browserVersion,

    /// Ortam bilgisi (örn: Production, Staging, Test, Local)
    String? environment,

    /// Referans kaynağı (örn: hangi sayfa ya da uygulama üzerinden çağırıldı)
    String? referrer,

    /// JWT Token ID veya Session ID (isteğe bağlı)
    String? sessionId,

    /// İstek yapan istemcinin tipini belirtir (örn: MobileApp, WebApp, APIClient)
    String? clientType,

    /// 3rd party client adı (jenerik API consumer’lar için)
    String? externalClientName,
  }) = _ClientMetadataModel;

  factory ClientMetadataModel.fromJson(Map<String, dynamic> json) => _$ClientMetadataModelFromJson(json);

  factory ClientMetadataModel.fromAccountModel() => ClientMetadataModel(
    platform: AccountModel.instance.platform,
    appName: "Picker",
    appVersion: AppInfoModel.instance.version,
    appBuildNumber: AppInfoModel.instance.buildNumber,
    osVersion: AccountModel.instance.cihazSistemVersiyonu,
    deviceId: AccountModel.instance.ozelCihazKimligi,
    timezone: DateTime.now().timeZoneOffset.inHours.toString(),
  );
}
