// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentResponseModel {

 String? get status; String? get message; dynamic get errorCode; String? get orderNumber; String? get transactionId; PrivateResponse? get privateResponse;
/// Create a copy of PaymentResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentResponseModelCopyWith<PaymentResponseModel> get copyWith => _$PaymentResponseModelCopyWithImpl<PaymentResponseModel>(this as PaymentResponseModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentResponseModel&&super == other&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.errorCode, errorCode)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.privateResponse, privateResponse) || other.privateResponse == privateResponse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(errorCode),orderNumber,transactionId,privateResponse);



}

/// @nodoc
abstract mixin class $PaymentResponseModelCopyWith<$Res>  {
  factory $PaymentResponseModelCopyWith(PaymentResponseModel value, $Res Function(PaymentResponseModel) _then) = _$PaymentResponseModelCopyWithImpl;
@useResult
$Res call({
 String? status, String? message, dynamic errorCode, String? orderNumber, String? transactionId, PrivateResponse? privateResponse
});




}
/// @nodoc
class _$PaymentResponseModelCopyWithImpl<$Res>
    implements $PaymentResponseModelCopyWith<$Res> {
  _$PaymentResponseModelCopyWithImpl(this._self, this._then);

  final PaymentResponseModel _self;
  final $Res Function(PaymentResponseModel) _then;

/// Create a copy of PaymentResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? errorCode = freezed,Object? orderNumber = freezed,Object? transactionId = freezed,Object? privateResponse = freezed,}) {
  return _then(PaymentResponseModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as dynamic,orderNumber: freezed == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String?,transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String?,privateResponse: freezed == privateResponse ? _self.privateResponse : privateResponse // ignore: cast_nullable_to_non_nullable
as PrivateResponse?,
  ));
}

}



/// @nodoc
mixin _$PrivateResponse {

@JsonKey(name: "Message") Message? get message;@JsonKey(name: "VerifyEnrollmentRequestId") String? get verifyEnrollmentRequestId;@JsonKey(name: "MessageErrorCode") String? get messageErrorCode;
/// Create a copy of PrivateResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrivateResponseCopyWith<PrivateResponse> get copyWith => _$PrivateResponseCopyWithImpl<PrivateResponse>(this as PrivateResponse, _$identity);

  /// Serializes this PrivateResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrivateResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.verifyEnrollmentRequestId, verifyEnrollmentRequestId) || other.verifyEnrollmentRequestId == verifyEnrollmentRequestId)&&(identical(other.messageErrorCode, messageErrorCode) || other.messageErrorCode == messageErrorCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,verifyEnrollmentRequestId,messageErrorCode);



}

/// @nodoc
abstract mixin class $PrivateResponseCopyWith<$Res>  {
  factory $PrivateResponseCopyWith(PrivateResponse value, $Res Function(PrivateResponse) _then) = _$PrivateResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Message") Message? message,@JsonKey(name: "VerifyEnrollmentRequestId") String? verifyEnrollmentRequestId,@JsonKey(name: "MessageErrorCode") String? messageErrorCode
});


$MessageCopyWith<$Res>? get message;

}
/// @nodoc
class _$PrivateResponseCopyWithImpl<$Res>
    implements $PrivateResponseCopyWith<$Res> {
  _$PrivateResponseCopyWithImpl(this._self, this._then);

  final PrivateResponse _self;
  final $Res Function(PrivateResponse) _then;

/// Create a copy of PrivateResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,Object? verifyEnrollmentRequestId = freezed,Object? messageErrorCode = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message?,verifyEnrollmentRequestId: freezed == verifyEnrollmentRequestId ? _self.verifyEnrollmentRequestId : verifyEnrollmentRequestId // ignore: cast_nullable_to_non_nullable
as String?,messageErrorCode: freezed == messageErrorCode ? _self.messageErrorCode : messageErrorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PrivateResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res>? get message {
    if (_self.message == null) {
    return null;
  }

  return $MessageCopyWith<$Res>(_self.message!, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _PrivateResponse implements PrivateResponse {
  const _PrivateResponse({@JsonKey(name: "Message") this.message, @JsonKey(name: "VerifyEnrollmentRequestId") this.verifyEnrollmentRequestId, @JsonKey(name: "MessageErrorCode") this.messageErrorCode});
  factory _PrivateResponse.fromJson(Map<String, dynamic> json) => _$PrivateResponseFromJson(json);

@override@JsonKey(name: "Message") final  Message? message;
@override@JsonKey(name: "VerifyEnrollmentRequestId") final  String? verifyEnrollmentRequestId;
@override@JsonKey(name: "MessageErrorCode") final  String? messageErrorCode;

/// Create a copy of PrivateResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrivateResponseCopyWith<_PrivateResponse> get copyWith => __$PrivateResponseCopyWithImpl<_PrivateResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrivateResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrivateResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.verifyEnrollmentRequestId, verifyEnrollmentRequestId) || other.verifyEnrollmentRequestId == verifyEnrollmentRequestId)&&(identical(other.messageErrorCode, messageErrorCode) || other.messageErrorCode == messageErrorCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,verifyEnrollmentRequestId,messageErrorCode);



}

/// @nodoc
abstract mixin class _$PrivateResponseCopyWith<$Res> implements $PrivateResponseCopyWith<$Res> {
  factory _$PrivateResponseCopyWith(_PrivateResponse value, $Res Function(_PrivateResponse) _then) = __$PrivateResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Message") Message? message,@JsonKey(name: "VerifyEnrollmentRequestId") String? verifyEnrollmentRequestId,@JsonKey(name: "MessageErrorCode") String? messageErrorCode
});


@override $MessageCopyWith<$Res>? get message;

}
/// @nodoc
class __$PrivateResponseCopyWithImpl<$Res>
    implements _$PrivateResponseCopyWith<$Res> {
  __$PrivateResponseCopyWithImpl(this._self, this._then);

  final _PrivateResponse _self;
  final $Res Function(_PrivateResponse) _then;

/// Create a copy of PrivateResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? verifyEnrollmentRequestId = freezed,Object? messageErrorCode = freezed,}) {
  return _then(_PrivateResponse(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message?,verifyEnrollmentRequestId: freezed == verifyEnrollmentRequestId ? _self.verifyEnrollmentRequestId : verifyEnrollmentRequestId // ignore: cast_nullable_to_non_nullable
as String?,messageErrorCode: freezed == messageErrorCode ? _self.messageErrorCode : messageErrorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PrivateResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res>? get message {
    if (_self.message == null) {
    return null;
  }

  return $MessageCopyWith<$Res>(_self.message!, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}


/// @nodoc
mixin _$Message {

@JsonKey(name: "VERes") VeRes? get veRes;
/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageCopyWith<Message> get copyWith => _$MessageCopyWithImpl<Message>(this as Message, _$identity);

  /// Serializes this Message to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Message&&(identical(other.veRes, veRes) || other.veRes == veRes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,veRes);



}

/// @nodoc
abstract mixin class $MessageCopyWith<$Res>  {
  factory $MessageCopyWith(Message value, $Res Function(Message) _then) = _$MessageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "VERes") VeRes? veRes
});


$VeResCopyWith<$Res>? get veRes;

}
/// @nodoc
class _$MessageCopyWithImpl<$Res>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._self, this._then);

  final Message _self;
  final $Res Function(Message) _then;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? veRes = freezed,}) {
  return _then(_self.copyWith(
veRes: freezed == veRes ? _self.veRes : veRes // ignore: cast_nullable_to_non_nullable
as VeRes?,
  ));
}
/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VeResCopyWith<$Res>? get veRes {
    if (_self.veRes == null) {
    return null;
  }

  return $VeResCopyWith<$Res>(_self.veRes!, (value) {
    return _then(_self.copyWith(veRes: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Message implements Message {
  const _Message({@JsonKey(name: "VERes") this.veRes});
  factory _Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

@override@JsonKey(name: "VERes") final  VeRes? veRes;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageCopyWith<_Message> get copyWith => __$MessageCopyWithImpl<_Message>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Message&&(identical(other.veRes, veRes) || other.veRes == veRes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,veRes);



}

/// @nodoc
abstract mixin class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) _then) = __$MessageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "VERes") VeRes? veRes
});


@override $VeResCopyWith<$Res>? get veRes;

}
/// @nodoc
class __$MessageCopyWithImpl<$Res>
    implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(this._self, this._then);

  final _Message _self;
  final $Res Function(_Message) _then;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? veRes = freezed,}) {
  return _then(_Message(
veRes: freezed == veRes ? _self.veRes : veRes // ignore: cast_nullable_to_non_nullable
as VeRes?,
  ));
}

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VeResCopyWith<$Res>? get veRes {
    if (_self.veRes == null) {
    return null;
  }

  return $VeResCopyWith<$Res>(_self.veRes!, (value) {
    return _then(_self.copyWith(veRes: value));
  });
}
}


/// @nodoc
mixin _$VeRes {

@JsonKey(name: "Version") String? get version;@JsonKey(name: "Status") String? get status;@JsonKey(name: "PaReq") String? get paReq;@JsonKey(name: "ACSUrl") String? get acsUrl;@JsonKey(name: "TermUrl") String? get termUrl;@JsonKey(name: "MD") String? get md;@JsonKey(name: "ACTUALBRAND") String? get actualbrand;
/// Create a copy of VeRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VeResCopyWith<VeRes> get copyWith => _$VeResCopyWithImpl<VeRes>(this as VeRes, _$identity);

  /// Serializes this VeRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VeRes&&(identical(other.version, version) || other.version == version)&&(identical(other.status, status) || other.status == status)&&(identical(other.paReq, paReq) || other.paReq == paReq)&&(identical(other.acsUrl, acsUrl) || other.acsUrl == acsUrl)&&(identical(other.termUrl, termUrl) || other.termUrl == termUrl)&&(identical(other.md, md) || other.md == md)&&(identical(other.actualbrand, actualbrand) || other.actualbrand == actualbrand));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,status,paReq,acsUrl,termUrl,md,actualbrand);



}

/// @nodoc
abstract mixin class $VeResCopyWith<$Res>  {
  factory $VeResCopyWith(VeRes value, $Res Function(VeRes) _then) = _$VeResCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Version") String? version,@JsonKey(name: "Status") String? status,@JsonKey(name: "PaReq") String? paReq,@JsonKey(name: "ACSUrl") String? acsUrl,@JsonKey(name: "TermUrl") String? termUrl,@JsonKey(name: "MD") String? md,@JsonKey(name: "ACTUALBRAND") String? actualbrand
});




}
/// @nodoc
class _$VeResCopyWithImpl<$Res>
    implements $VeResCopyWith<$Res> {
  _$VeResCopyWithImpl(this._self, this._then);

  final VeRes _self;
  final $Res Function(VeRes) _then;

/// Create a copy of VeRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = freezed,Object? status = freezed,Object? paReq = freezed,Object? acsUrl = freezed,Object? termUrl = freezed,Object? md = freezed,Object? actualbrand = freezed,}) {
  return _then(_self.copyWith(
version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,paReq: freezed == paReq ? _self.paReq : paReq // ignore: cast_nullable_to_non_nullable
as String?,acsUrl: freezed == acsUrl ? _self.acsUrl : acsUrl // ignore: cast_nullable_to_non_nullable
as String?,termUrl: freezed == termUrl ? _self.termUrl : termUrl // ignore: cast_nullable_to_non_nullable
as String?,md: freezed == md ? _self.md : md // ignore: cast_nullable_to_non_nullable
as String?,actualbrand: freezed == actualbrand ? _self.actualbrand : actualbrand // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _VeRes implements VeRes {
  const _VeRes({@JsonKey(name: "Version") this.version, @JsonKey(name: "Status") this.status, @JsonKey(name: "PaReq") this.paReq, @JsonKey(name: "ACSUrl") this.acsUrl, @JsonKey(name: "TermUrl") this.termUrl, @JsonKey(name: "MD") this.md, @JsonKey(name: "ACTUALBRAND") this.actualbrand});
  factory _VeRes.fromJson(Map<String, dynamic> json) => _$VeResFromJson(json);

@override@JsonKey(name: "Version") final  String? version;
@override@JsonKey(name: "Status") final  String? status;
@override@JsonKey(name: "PaReq") final  String? paReq;
@override@JsonKey(name: "ACSUrl") final  String? acsUrl;
@override@JsonKey(name: "TermUrl") final  String? termUrl;
@override@JsonKey(name: "MD") final  String? md;
@override@JsonKey(name: "ACTUALBRAND") final  String? actualbrand;

/// Create a copy of VeRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VeResCopyWith<_VeRes> get copyWith => __$VeResCopyWithImpl<_VeRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VeResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VeRes&&(identical(other.version, version) || other.version == version)&&(identical(other.status, status) || other.status == status)&&(identical(other.paReq, paReq) || other.paReq == paReq)&&(identical(other.acsUrl, acsUrl) || other.acsUrl == acsUrl)&&(identical(other.termUrl, termUrl) || other.termUrl == termUrl)&&(identical(other.md, md) || other.md == md)&&(identical(other.actualbrand, actualbrand) || other.actualbrand == actualbrand));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,status,paReq,acsUrl,termUrl,md,actualbrand);



}

/// @nodoc
abstract mixin class _$VeResCopyWith<$Res> implements $VeResCopyWith<$Res> {
  factory _$VeResCopyWith(_VeRes value, $Res Function(_VeRes) _then) = __$VeResCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Version") String? version,@JsonKey(name: "Status") String? status,@JsonKey(name: "PaReq") String? paReq,@JsonKey(name: "ACSUrl") String? acsUrl,@JsonKey(name: "TermUrl") String? termUrl,@JsonKey(name: "MD") String? md,@JsonKey(name: "ACTUALBRAND") String? actualbrand
});




}
/// @nodoc
class __$VeResCopyWithImpl<$Res>
    implements _$VeResCopyWith<$Res> {
  __$VeResCopyWithImpl(this._self, this._then);

  final _VeRes _self;
  final $Res Function(_VeRes) _then;

/// Create a copy of VeRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = freezed,Object? status = freezed,Object? paReq = freezed,Object? acsUrl = freezed,Object? termUrl = freezed,Object? md = freezed,Object? actualbrand = freezed,}) {
  return _then(_VeRes(
version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,paReq: freezed == paReq ? _self.paReq : paReq // ignore: cast_nullable_to_non_nullable
as String?,acsUrl: freezed == acsUrl ? _self.acsUrl : acsUrl // ignore: cast_nullable_to_non_nullable
as String?,termUrl: freezed == termUrl ? _self.termUrl : termUrl // ignore: cast_nullable_to_non_nullable
as String?,md: freezed == md ? _self.md : md // ignore: cast_nullable_to_non_nullable
as String?,actualbrand: freezed == actualbrand ? _self.actualbrand : actualbrand // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
