import "base_network_mixin.dart";

final class GenericResponseModel<T extends NetworkManagerMixin> {
  GenericResponseModel({
    this.message,
    this.messageModel,
    this.messageDetail,
    bool? success,
    this.exceptionName,
    this.errorDetails,
    this.exceptionStackTrace,
    this.paramData,
    this.serviceVersion,
    this.errorCode,
    this.ex,
  }) : _success = success;

  GenericResponseModel.fromJson(Map<String, dynamic> json, this.model) {
    if (json["Message"] case final Map value?) messageModel = value.map((key, value) => MapEntry(key, value));
    if (json["Message"] case final String value?) message = value;
    messageDetail = json["MessageDetail"];
    exceptionName = json["ExceptionName"];
    errorDetails = json["ErrorDetails"];
    exceptionStackTrace = json["ExceptionStackTrace"];
    paramData = json["ParamData"];
    serviceVersion = json["ServiceVersion"];
    errorCode = json["errorCode"];
    ex = json["Ex"];

    if (json["Data"] is List) {
      _data = json["Data"].map((e) => model?.fromJson(e)).toList();
    } else if (json["Data"] is Map<String, dynamic>) {
      _data = model?.fromJson(json["Data"]);
    } else {
      _data = json["Data"];
    }
    _success = json["Success"] ?? (_data != null);
  }
  String? message;
  String? messageDetail;
  bool? _success;
  dynamic _data;
  T? model;
  String? exceptionName;
  String? errorDetails;
  String? exceptionStackTrace;
  Map<String, dynamic>? paramData;
  String? serviceVersion;
  int? errorCode;
  Map<String, dynamic>? ex;
  Map<String, dynamic>? messageModel;

  bool get isSuccess => _success == true;

  List<T> get dataList => _data is List ? (_data as List).map((e) => e as T).toList() : [];

  T get dataItem => _data as T;
}
