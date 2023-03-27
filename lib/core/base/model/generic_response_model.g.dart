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
        return val;
      },
      fieldKeyMap: const {
        'message': 'Message',
        'messageDetail': 'MessageDetail',
        'success': 'Success',
        'data': 'Data',
        'exceptionName': 'ExceptionName',
        'errorDetails': 'ErrorDetails'
      },
    );
