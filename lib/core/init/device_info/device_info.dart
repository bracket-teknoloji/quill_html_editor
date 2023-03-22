import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:hive_flutter/adapters.dart';

import '../../base/model/base_network_model.dart';

@HiveType(typeId: 15)
class DeviceInfoModel extends HiveObject with NetworkManagerMixin {
  static final _deviceInfoPlugin = DeviceInfoPlugin();
  
  @HiveField(0)
  Future<String> get deviceName async {
    if (Platform.isAndroid) {
      return (await _deviceInfoPlugin.androidInfo).model;
    } else if (Platform.isIOS) {
      return (await _deviceInfoPlugin.iosInfo).name ?? "Unknown";
    } else {
      return "Unknown";
    }
  }
  @HiveField(1)
  Future<String> get deviceVersion async {
    if (Platform.isAndroid) {
      return (await _deviceInfoPlugin.androidInfo).version.release;
    } else if (Platform.isIOS) {
      return (await _deviceInfoPlugin.iosInfo).systemVersion ?? "Unknown";
    } else {
      return "Unknown";
    }
  }
  @HiveField(2)
  Future<String> get deviceModel async {
    if (Platform.isAndroid) {
      return (await _deviceInfoPlugin.androidInfo).model;
    } else if (Platform.isIOS) {
      return (await _deviceInfoPlugin.iosInfo).model ?? "Unknown";
    } else {
      return "Unknown";
    }
  }
  @HiveField(3)
  Future<String> get deviceBrand async {
    if (Platform.isAndroid) {
      return (await _deviceInfoPlugin.androidInfo).brand;
    } else if (Platform.isIOS) {
      return (await _deviceInfoPlugin.iosInfo).model ?? "Unknown";
    } else {
      return "Unknown";
    }
  }
  @HiveField(4)
  Future<Map> get deviceData async {
    if (Platform.isAndroid) {
      return (await _deviceInfoPlugin.androidInfo).data;
    }else {
      return {};
    }
  }
  @HiveField(5)
  late final String deviceType;

  DeviceInfoModel();

  @override
  Map<String, dynamic> toJson() {
    return Map<String, dynamic>.from({
      "deviceName": deviceName,
      "deviceVersion": deviceVersion,
      "deviceModel": deviceModel,
      "deviceBrand": deviceBrand,
      "deviceIdentifier": deviceData,
      "deviceType": deviceType
    });
  }

  @override
  toString() => """
DeviceInfoModel {\n
                  deviceName: $deviceName,\n
                  deviceVersion: $deviceVersion,\n
                   deviceModel: $deviceModel,\n
                   deviceBrand: $deviceBrand,\n
                   deviceIdentifier: $deviceData,\n
                   deviceType: $deviceType \n
                 }""";

  @override
  fromJson(Map<String, dynamic> json) {}
}
