import 'package:picker/core/base/model/base_network_mixin.dart';

class GenericResponseModel<T extends NetworkManagerMixin> {
  String? message;
  String? messageDetail;
  bool? success;
  T? model;
  List<T>? data;
  String? exceptionName;
  String? errorDetails;

  GenericResponseModel({this.model});

  GenericResponseModel.fromJson(Map<String, dynamic> json, {this.model}) {
    message = json['Message'];
    messageDetail = json['MessageDetail'];
    success = json['Success'];
    exceptionName = json['ExceptionName'];
    errorDetails = json['ErrorDetails'];
    data = List.castFrom(json['Data'])
        .map((e) => model!.fromJson(e))
        .toList()
        .cast<T>();
  }
}
