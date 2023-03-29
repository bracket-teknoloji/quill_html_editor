// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'generic_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericResponseModel<T> _$GenericResponseModelFromJson<
        T extends NetworkManagerMixin>(Map<String, dynamic> json) =>
    $checkedCreate(
      'GenericResponseModel',
      json,
      ($checkedConvert) {
        final val = GenericResponseModel<T>();
        $checkedConvert('Message', (v) => val.message = v as String?);
        $checkedConvert(
            'MessageDetail', (v) => val.messageDetail = v as String?);
        $checkedConvert('Success', (v) => val.success = v as bool?);
        $checkedConvert('Data', (v) => val.data = v);
        $checkedConvert(
            'ExceptionName', (v) => val.exceptionName = v as String?);
        $checkedConvert('ErrorDetails', (v) => val.errorDetails = v as String?);
        $checkedConvert('ExceptionStackTrace',
            (v) => val.exceptionStackTrace = v as String?);
        $checkedConvert(
            'ParamData', (v) => val.paramData = v as Map<String, dynamic>?);
        $checkedConvert(
            'ServiceVersion', (v) => val.serviceVersion = v as String?);
        $checkedConvert('errorCode', (v) => val.errorCode = v as int?);
        return val;
      },
      fieldKeyMap: const {
        'message': 'Message',
        'messageDetail': 'MessageDetail',
        'success': 'Success',
        'data': 'Data',
        'exceptionName': 'ExceptionName',
        'errorDetails': 'ErrorDetails',
        'exceptionStackTrace': 'ExceptionStackTrace',
        'paramData': 'ParamData',
        'serviceVersion': 'ServiceVersion'
      },
    );
