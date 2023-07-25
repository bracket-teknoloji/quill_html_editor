// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericResponseModel<T>
    _$GenericResponseModelFromJson<T extends NetworkManagerMixin>(
            Map<String, dynamic> json) =>
        GenericResponseModel<T>(
          message: json['Message'] as String?,
          messageDetail: json['MessageDetail'] as String?,
          success: json['Success'] as bool?,
          exceptionName: json['ExceptionName'] as String?,
          errorDetails: json['ErrorDetails'] as String?,
          exceptionStackTrace: json['ExceptionStackTrace'] as String?,
          paramData: json['ParamData'] as Map<String, dynamic>?,
          serviceVersion: json['ServiceVersion'] as String?,
          errorCode: json['errorCode'] as int?,
        )..data = json['Data'];
