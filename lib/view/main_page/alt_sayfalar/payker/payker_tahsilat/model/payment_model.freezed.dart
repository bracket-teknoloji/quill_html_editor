// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentModel {

@JsonKey(name: "CustomerIPAddress") String? get customerIpAddress;@JsonKey(name: "CustomerMailAddress") String? get customerMailAddress;@JsonKey(name: "CustomerInfo") CustomerInfo? get customerInfo;@JsonKey(name: "Order") Order? get order;@JsonKey(name: "SaleInfo") SaleInfo? get saleInfo;@JsonKey(name: "Payment3D") Payment3D? get payment3D;
/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentModelCopyWith<PaymentModel> get copyWith => _$PaymentModelCopyWithImpl<PaymentModel>(this as PaymentModel, _$identity);

  /// Serializes this PaymentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentModel&&(identical(other.customerIpAddress, customerIpAddress) || other.customerIpAddress == customerIpAddress)&&(identical(other.customerMailAddress, customerMailAddress) || other.customerMailAddress == customerMailAddress)&&(identical(other.customerInfo, customerInfo) || other.customerInfo == customerInfo)&&(identical(other.order, order) || other.order == order)&&(identical(other.saleInfo, saleInfo) || other.saleInfo == saleInfo)&&(identical(other.payment3D, payment3D) || other.payment3D == payment3D));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerIpAddress,customerMailAddress,customerInfo,order,saleInfo,payment3D);



}

/// @nodoc
abstract mixin class $PaymentModelCopyWith<$Res>  {
  factory $PaymentModelCopyWith(PaymentModel value, $Res Function(PaymentModel) _then) = _$PaymentModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "CustomerIPAddress") String? customerIpAddress,@JsonKey(name: "CustomerMailAddress") String? customerMailAddress,@JsonKey(name: "CustomerInfo") CustomerInfo? customerInfo,@JsonKey(name: "Order") Order? order,@JsonKey(name: "SaleInfo") SaleInfo? saleInfo,@JsonKey(name: "Payment3D") Payment3D? payment3D
});


$CustomerInfoCopyWith<$Res>? get customerInfo;$OrderCopyWith<$Res>? get order;$SaleInfoCopyWith<$Res>? get saleInfo;$Payment3DCopyWith<$Res>? get payment3D;

}
/// @nodoc
class _$PaymentModelCopyWithImpl<$Res>
    implements $PaymentModelCopyWith<$Res> {
  _$PaymentModelCopyWithImpl(this._self, this._then);

  final PaymentModel _self;
  final $Res Function(PaymentModel) _then;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customerIpAddress = freezed,Object? customerMailAddress = freezed,Object? customerInfo = freezed,Object? order = freezed,Object? saleInfo = freezed,Object? payment3D = freezed,}) {
  return _then(_self.copyWith(
customerIpAddress: freezed == customerIpAddress ? _self.customerIpAddress : customerIpAddress // ignore: cast_nullable_to_non_nullable
as String?,customerMailAddress: freezed == customerMailAddress ? _self.customerMailAddress : customerMailAddress // ignore: cast_nullable_to_non_nullable
as String?,customerInfo: freezed == customerInfo ? _self.customerInfo : customerInfo // ignore: cast_nullable_to_non_nullable
as CustomerInfo?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as Order?,saleInfo: freezed == saleInfo ? _self.saleInfo : saleInfo // ignore: cast_nullable_to_non_nullable
as SaleInfo?,payment3D: freezed == payment3D ? _self.payment3D : payment3D // ignore: cast_nullable_to_non_nullable
as Payment3D?,
  ));
}
/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerInfoCopyWith<$Res>? get customerInfo {
    if (_self.customerInfo == null) {
    return null;
  }

  return $CustomerInfoCopyWith<$Res>(_self.customerInfo!, (value) {
    return _then(_self.copyWith(customerInfo: value));
  });
}/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCopyWith<$Res>? get order {
    if (_self.order == null) {
    return null;
  }

  return $OrderCopyWith<$Res>(_self.order!, (value) {
    return _then(_self.copyWith(order: value));
  });
}/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleInfoCopyWith<$Res>? get saleInfo {
    if (_self.saleInfo == null) {
    return null;
  }

  return $SaleInfoCopyWith<$Res>(_self.saleInfo!, (value) {
    return _then(_self.copyWith(saleInfo: value));
  });
}/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Payment3DCopyWith<$Res>? get payment3D {
    if (_self.payment3D == null) {
    return null;
  }

  return $Payment3DCopyWith<$Res>(_self.payment3D!, (value) {
    return _then(_self.copyWith(payment3D: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _PaymentModel implements PaymentModel {
  const _PaymentModel({@JsonKey(name: "CustomerIPAddress") this.customerIpAddress, @JsonKey(name: "CustomerMailAddress") this.customerMailAddress, @JsonKey(name: "CustomerInfo") this.customerInfo, @JsonKey(name: "Order") this.order, @JsonKey(name: "SaleInfo") this.saleInfo, @JsonKey(name: "Payment3D") this.payment3D});
  factory _PaymentModel.fromJson(Map<String, dynamic> json) => _$PaymentModelFromJson(json);

@override@JsonKey(name: "CustomerIPAddress") final  String? customerIpAddress;
@override@JsonKey(name: "CustomerMailAddress") final  String? customerMailAddress;
@override@JsonKey(name: "CustomerInfo") final  CustomerInfo? customerInfo;
@override@JsonKey(name: "Order") final  Order? order;
@override@JsonKey(name: "SaleInfo") final  SaleInfo? saleInfo;
@override@JsonKey(name: "Payment3D") final  Payment3D? payment3D;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentModelCopyWith<_PaymentModel> get copyWith => __$PaymentModelCopyWithImpl<_PaymentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentModel&&(identical(other.customerIpAddress, customerIpAddress) || other.customerIpAddress == customerIpAddress)&&(identical(other.customerMailAddress, customerMailAddress) || other.customerMailAddress == customerMailAddress)&&(identical(other.customerInfo, customerInfo) || other.customerInfo == customerInfo)&&(identical(other.order, order) || other.order == order)&&(identical(other.saleInfo, saleInfo) || other.saleInfo == saleInfo)&&(identical(other.payment3D, payment3D) || other.payment3D == payment3D));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerIpAddress,customerMailAddress,customerInfo,order,saleInfo,payment3D);



}

/// @nodoc
abstract mixin class _$PaymentModelCopyWith<$Res> implements $PaymentModelCopyWith<$Res> {
  factory _$PaymentModelCopyWith(_PaymentModel value, $Res Function(_PaymentModel) _then) = __$PaymentModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "CustomerIPAddress") String? customerIpAddress,@JsonKey(name: "CustomerMailAddress") String? customerMailAddress,@JsonKey(name: "CustomerInfo") CustomerInfo? customerInfo,@JsonKey(name: "Order") Order? order,@JsonKey(name: "SaleInfo") SaleInfo? saleInfo,@JsonKey(name: "Payment3D") Payment3D? payment3D
});


@override $CustomerInfoCopyWith<$Res>? get customerInfo;@override $OrderCopyWith<$Res>? get order;@override $SaleInfoCopyWith<$Res>? get saleInfo;@override $Payment3DCopyWith<$Res>? get payment3D;

}
/// @nodoc
class __$PaymentModelCopyWithImpl<$Res>
    implements _$PaymentModelCopyWith<$Res> {
  __$PaymentModelCopyWithImpl(this._self, this._then);

  final _PaymentModel _self;
  final $Res Function(_PaymentModel) _then;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customerIpAddress = freezed,Object? customerMailAddress = freezed,Object? customerInfo = freezed,Object? order = freezed,Object? saleInfo = freezed,Object? payment3D = freezed,}) {
  return _then(_PaymentModel(
customerIpAddress: freezed == customerIpAddress ? _self.customerIpAddress : customerIpAddress // ignore: cast_nullable_to_non_nullable
as String?,customerMailAddress: freezed == customerMailAddress ? _self.customerMailAddress : customerMailAddress // ignore: cast_nullable_to_non_nullable
as String?,customerInfo: freezed == customerInfo ? _self.customerInfo : customerInfo // ignore: cast_nullable_to_non_nullable
as CustomerInfo?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as Order?,saleInfo: freezed == saleInfo ? _self.saleInfo : saleInfo // ignore: cast_nullable_to_non_nullable
as SaleInfo?,payment3D: freezed == payment3D ? _self.payment3D : payment3D // ignore: cast_nullable_to_non_nullable
as Payment3D?,
  ));
}

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerInfoCopyWith<$Res>? get customerInfo {
    if (_self.customerInfo == null) {
    return null;
  }

  return $CustomerInfoCopyWith<$Res>(_self.customerInfo!, (value) {
    return _then(_self.copyWith(customerInfo: value));
  });
}/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderCopyWith<$Res>? get order {
    if (_self.order == null) {
    return null;
  }

  return $OrderCopyWith<$Res>(_self.order!, (value) {
    return _then(_self.copyWith(order: value));
  });
}/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleInfoCopyWith<$Res>? get saleInfo {
    if (_self.saleInfo == null) {
    return null;
  }

  return $SaleInfoCopyWith<$Res>(_self.saleInfo!, (value) {
    return _then(_self.copyWith(saleInfo: value));
  });
}/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$Payment3DCopyWith<$Res>? get payment3D {
    if (_self.payment3D == null) {
    return null;
  }

  return $Payment3DCopyWith<$Res>(_self.payment3D!, (value) {
    return _then(_self.copyWith(payment3D: value));
  });
}
}


/// @nodoc
mixin _$CustomerInfo {

@JsonKey(name: "CustomerId") String? get customerId;@JsonKey(name: "Name") String? get name;@JsonKey(name: "Surname") String? get surname;@JsonKey(name: "EmailAddress") String? get emailAddress;@JsonKey(name: "PhoneNumber") String? get phoneNumber;@JsonKey(name: "TaxNumber") String? get taxNumber;@JsonKey(name: "TaxOffice") String? get taxOffice;@JsonKey(name: "Country") int? get country;@JsonKey(name: "CityName") String? get cityName;@JsonKey(name: "TownName") String? get townName;@JsonKey(name: "AddressDesc") String? get addressDesc;@JsonKey(name: "PostCode") String? get postCode;
/// Create a copy of CustomerInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerInfoCopyWith<CustomerInfo> get copyWith => _$CustomerInfoCopyWithImpl<CustomerInfo>(this as CustomerInfo, _$identity);

  /// Serializes this CustomerInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerInfo&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.emailAddress, emailAddress) || other.emailAddress == emailAddress)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.taxNumber, taxNumber) || other.taxNumber == taxNumber)&&(identical(other.taxOffice, taxOffice) || other.taxOffice == taxOffice)&&(identical(other.country, country) || other.country == country)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.townName, townName) || other.townName == townName)&&(identical(other.addressDesc, addressDesc) || other.addressDesc == addressDesc)&&(identical(other.postCode, postCode) || other.postCode == postCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerId,name,surname,emailAddress,phoneNumber,taxNumber,taxOffice,country,cityName,townName,addressDesc,postCode);



}

/// @nodoc
abstract mixin class $CustomerInfoCopyWith<$Res>  {
  factory $CustomerInfoCopyWith(CustomerInfo value, $Res Function(CustomerInfo) _then) = _$CustomerInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "CustomerId") String? customerId,@JsonKey(name: "Name") String? name,@JsonKey(name: "Surname") String? surname,@JsonKey(name: "EmailAddress") String? emailAddress,@JsonKey(name: "PhoneNumber") String? phoneNumber,@JsonKey(name: "TaxNumber") String? taxNumber,@JsonKey(name: "TaxOffice") String? taxOffice,@JsonKey(name: "Country") int? country,@JsonKey(name: "CityName") String? cityName,@JsonKey(name: "TownName") String? townName,@JsonKey(name: "AddressDesc") String? addressDesc,@JsonKey(name: "PostCode") String? postCode
});




}
/// @nodoc
class _$CustomerInfoCopyWithImpl<$Res>
    implements $CustomerInfoCopyWith<$Res> {
  _$CustomerInfoCopyWithImpl(this._self, this._then);

  final CustomerInfo _self;
  final $Res Function(CustomerInfo) _then;

/// Create a copy of CustomerInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customerId = freezed,Object? name = freezed,Object? surname = freezed,Object? emailAddress = freezed,Object? phoneNumber = freezed,Object? taxNumber = freezed,Object? taxOffice = freezed,Object? country = freezed,Object? cityName = freezed,Object? townName = freezed,Object? addressDesc = freezed,Object? postCode = freezed,}) {
  return _then(_self.copyWith(
customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,surname: freezed == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String?,emailAddress: freezed == emailAddress ? _self.emailAddress : emailAddress // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,taxNumber: freezed == taxNumber ? _self.taxNumber : taxNumber // ignore: cast_nullable_to_non_nullable
as String?,taxOffice: freezed == taxOffice ? _self.taxOffice : taxOffice // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as int?,cityName: freezed == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String?,townName: freezed == townName ? _self.townName : townName // ignore: cast_nullable_to_non_nullable
as String?,addressDesc: freezed == addressDesc ? _self.addressDesc : addressDesc // ignore: cast_nullable_to_non_nullable
as String?,postCode: freezed == postCode ? _self.postCode : postCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CustomerInfo implements CustomerInfo {
  const _CustomerInfo({@JsonKey(name: "CustomerId") this.customerId, @JsonKey(name: "Name") this.name, @JsonKey(name: "Surname") this.surname, @JsonKey(name: "EmailAddress") this.emailAddress, @JsonKey(name: "PhoneNumber") this.phoneNumber, @JsonKey(name: "TaxNumber") this.taxNumber, @JsonKey(name: "TaxOffice") this.taxOffice, @JsonKey(name: "Country") this.country, @JsonKey(name: "CityName") this.cityName, @JsonKey(name: "TownName") this.townName, @JsonKey(name: "AddressDesc") this.addressDesc, @JsonKey(name: "PostCode") this.postCode});
  factory _CustomerInfo.fromJson(Map<String, dynamic> json) => _$CustomerInfoFromJson(json);

@override@JsonKey(name: "CustomerId") final  String? customerId;
@override@JsonKey(name: "Name") final  String? name;
@override@JsonKey(name: "Surname") final  String? surname;
@override@JsonKey(name: "EmailAddress") final  String? emailAddress;
@override@JsonKey(name: "PhoneNumber") final  String? phoneNumber;
@override@JsonKey(name: "TaxNumber") final  String? taxNumber;
@override@JsonKey(name: "TaxOffice") final  String? taxOffice;
@override@JsonKey(name: "Country") final  int? country;
@override@JsonKey(name: "CityName") final  String? cityName;
@override@JsonKey(name: "TownName") final  String? townName;
@override@JsonKey(name: "AddressDesc") final  String? addressDesc;
@override@JsonKey(name: "PostCode") final  String? postCode;

/// Create a copy of CustomerInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerInfoCopyWith<_CustomerInfo> get copyWith => __$CustomerInfoCopyWithImpl<_CustomerInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerInfo&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.emailAddress, emailAddress) || other.emailAddress == emailAddress)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.taxNumber, taxNumber) || other.taxNumber == taxNumber)&&(identical(other.taxOffice, taxOffice) || other.taxOffice == taxOffice)&&(identical(other.country, country) || other.country == country)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.townName, townName) || other.townName == townName)&&(identical(other.addressDesc, addressDesc) || other.addressDesc == addressDesc)&&(identical(other.postCode, postCode) || other.postCode == postCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerId,name,surname,emailAddress,phoneNumber,taxNumber,taxOffice,country,cityName,townName,addressDesc,postCode);



}

/// @nodoc
abstract mixin class _$CustomerInfoCopyWith<$Res> implements $CustomerInfoCopyWith<$Res> {
  factory _$CustomerInfoCopyWith(_CustomerInfo value, $Res Function(_CustomerInfo) _then) = __$CustomerInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "CustomerId") String? customerId,@JsonKey(name: "Name") String? name,@JsonKey(name: "Surname") String? surname,@JsonKey(name: "EmailAddress") String? emailAddress,@JsonKey(name: "PhoneNumber") String? phoneNumber,@JsonKey(name: "TaxNumber") String? taxNumber,@JsonKey(name: "TaxOffice") String? taxOffice,@JsonKey(name: "Country") int? country,@JsonKey(name: "CityName") String? cityName,@JsonKey(name: "TownName") String? townName,@JsonKey(name: "AddressDesc") String? addressDesc,@JsonKey(name: "PostCode") String? postCode
});




}
/// @nodoc
class __$CustomerInfoCopyWithImpl<$Res>
    implements _$CustomerInfoCopyWith<$Res> {
  __$CustomerInfoCopyWithImpl(this._self, this._then);

  final _CustomerInfo _self;
  final $Res Function(_CustomerInfo) _then;

/// Create a copy of CustomerInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customerId = freezed,Object? name = freezed,Object? surname = freezed,Object? emailAddress = freezed,Object? phoneNumber = freezed,Object? taxNumber = freezed,Object? taxOffice = freezed,Object? country = freezed,Object? cityName = freezed,Object? townName = freezed,Object? addressDesc = freezed,Object? postCode = freezed,}) {
  return _then(_CustomerInfo(
customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,surname: freezed == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String?,emailAddress: freezed == emailAddress ? _self.emailAddress : emailAddress // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,taxNumber: freezed == taxNumber ? _self.taxNumber : taxNumber // ignore: cast_nullable_to_non_nullable
as String?,taxOffice: freezed == taxOffice ? _self.taxOffice : taxOffice // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as int?,cityName: freezed == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String?,townName: freezed == townName ? _self.townName : townName // ignore: cast_nullable_to_non_nullable
as String?,addressDesc: freezed == addressDesc ? _self.addressDesc : addressDesc // ignore: cast_nullable_to_non_nullable
as String?,postCode: freezed == postCode ? _self.postCode : postCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Order {

@JsonKey(name: "OrderID") String? get orderId;@JsonKey(name: "GroupID") String? get groupId;@JsonKey(name: "Items") String? get items;@JsonKey(name: "Addresses") String? get addresses;@JsonKey(name: "Comments") String? get comments;@JsonKey(name: "Description") String? get description;
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCopyWith<Order> get copyWith => _$OrderCopyWithImpl<Order>(this as Order, _$identity);

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Order&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.items, items) || other.items == items)&&(identical(other.addresses, addresses) || other.addresses == addresses)&&(identical(other.comments, comments) || other.comments == comments)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,groupId,items,addresses,comments,description);



}

/// @nodoc
abstract mixin class $OrderCopyWith<$Res>  {
  factory $OrderCopyWith(Order value, $Res Function(Order) _then) = _$OrderCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "OrderID") String? orderId,@JsonKey(name: "GroupID") String? groupId,@JsonKey(name: "Items") String? items,@JsonKey(name: "Addresses") String? addresses,@JsonKey(name: "Comments") String? comments,@JsonKey(name: "Description") String? description
});




}
/// @nodoc
class _$OrderCopyWithImpl<$Res>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._self, this._then);

  final Order _self;
  final $Res Function(Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = freezed,Object? groupId = freezed,Object? items = freezed,Object? addresses = freezed,Object? comments = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as String?,addresses: freezed == addresses ? _self.addresses : addresses // ignore: cast_nullable_to_non_nullable
as String?,comments: freezed == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Order implements Order {
  const _Order({@JsonKey(name: "OrderID") this.orderId, @JsonKey(name: "GroupID") this.groupId, @JsonKey(name: "Items") this.items, @JsonKey(name: "Addresses") this.addresses, @JsonKey(name: "Comments") this.comments, @JsonKey(name: "Description") this.description});
  factory _Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

@override@JsonKey(name: "OrderID") final  String? orderId;
@override@JsonKey(name: "GroupID") final  String? groupId;
@override@JsonKey(name: "Items") final  String? items;
@override@JsonKey(name: "Addresses") final  String? addresses;
@override@JsonKey(name: "Comments") final  String? comments;
@override@JsonKey(name: "Description") final  String? description;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCopyWith<_Order> get copyWith => __$OrderCopyWithImpl<_Order>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Order&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.items, items) || other.items == items)&&(identical(other.addresses, addresses) || other.addresses == addresses)&&(identical(other.comments, comments) || other.comments == comments)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,groupId,items,addresses,comments,description);



}

/// @nodoc
abstract mixin class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) _then) = __$OrderCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "OrderID") String? orderId,@JsonKey(name: "GroupID") String? groupId,@JsonKey(name: "Items") String? items,@JsonKey(name: "Addresses") String? addresses,@JsonKey(name: "Comments") String? comments,@JsonKey(name: "Description") String? description
});




}
/// @nodoc
class __$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(this._self, this._then);

  final _Order _self;
  final $Res Function(_Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = freezed,Object? groupId = freezed,Object? items = freezed,Object? addresses = freezed,Object? comments = freezed,Object? description = freezed,}) {
  return _then(_Order(
orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as String?,addresses: freezed == addresses ? _self.addresses : addresses // ignore: cast_nullable_to_non_nullable
as String?,comments: freezed == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Payment3D {

@JsonKey(name: "Confirm") bool? get confirm;@JsonKey(name: "ReturnURL") String? get returnUrl;@JsonKey(name: "IsDesktop") bool? get isDesktop;
/// Create a copy of Payment3D
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$Payment3DCopyWith<Payment3D> get copyWith => _$Payment3DCopyWithImpl<Payment3D>(this as Payment3D, _$identity);

  /// Serializes this Payment3D to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Payment3D&&(identical(other.confirm, confirm) || other.confirm == confirm)&&(identical(other.returnUrl, returnUrl) || other.returnUrl == returnUrl)&&(identical(other.isDesktop, isDesktop) || other.isDesktop == isDesktop));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,confirm,returnUrl,isDesktop);



}

/// @nodoc
abstract mixin class $Payment3DCopyWith<$Res>  {
  factory $Payment3DCopyWith(Payment3D value, $Res Function(Payment3D) _then) = _$Payment3DCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "Confirm") bool? confirm,@JsonKey(name: "ReturnURL") String? returnUrl,@JsonKey(name: "IsDesktop") bool? isDesktop
});




}
/// @nodoc
class _$Payment3DCopyWithImpl<$Res>
    implements $Payment3DCopyWith<$Res> {
  _$Payment3DCopyWithImpl(this._self, this._then);

  final Payment3D _self;
  final $Res Function(Payment3D) _then;

/// Create a copy of Payment3D
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? confirm = freezed,Object? returnUrl = freezed,Object? isDesktop = freezed,}) {
  return _then(_self.copyWith(
confirm: freezed == confirm ? _self.confirm : confirm // ignore: cast_nullable_to_non_nullable
as bool?,returnUrl: freezed == returnUrl ? _self.returnUrl : returnUrl // ignore: cast_nullable_to_non_nullable
as String?,isDesktop: freezed == isDesktop ? _self.isDesktop : isDesktop // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Payment3D implements Payment3D {
  const _Payment3D({@JsonKey(name: "Confirm") this.confirm, @JsonKey(name: "ReturnURL") this.returnUrl, @JsonKey(name: "IsDesktop") this.isDesktop});
  factory _Payment3D.fromJson(Map<String, dynamic> json) => _$Payment3DFromJson(json);

@override@JsonKey(name: "Confirm") final  bool? confirm;
@override@JsonKey(name: "ReturnURL") final  String? returnUrl;
@override@JsonKey(name: "IsDesktop") final  bool? isDesktop;

/// Create a copy of Payment3D
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$Payment3DCopyWith<_Payment3D> get copyWith => __$Payment3DCopyWithImpl<_Payment3D>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$Payment3DToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Payment3D&&(identical(other.confirm, confirm) || other.confirm == confirm)&&(identical(other.returnUrl, returnUrl) || other.returnUrl == returnUrl)&&(identical(other.isDesktop, isDesktop) || other.isDesktop == isDesktop));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,confirm,returnUrl,isDesktop);



}

/// @nodoc
abstract mixin class _$Payment3DCopyWith<$Res> implements $Payment3DCopyWith<$Res> {
  factory _$Payment3DCopyWith(_Payment3D value, $Res Function(_Payment3D) _then) = __$Payment3DCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "Confirm") bool? confirm,@JsonKey(name: "ReturnURL") String? returnUrl,@JsonKey(name: "IsDesktop") bool? isDesktop
});




}
/// @nodoc
class __$Payment3DCopyWithImpl<$Res>
    implements _$Payment3DCopyWith<$Res> {
  __$Payment3DCopyWithImpl(this._self, this._then);

  final _Payment3D _self;
  final $Res Function(_Payment3D) _then;

/// Create a copy of Payment3D
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? confirm = freezed,Object? returnUrl = freezed,Object? isDesktop = freezed,}) {
  return _then(_Payment3D(
confirm: freezed == confirm ? _self.confirm : confirm // ignore: cast_nullable_to_non_nullable
as bool?,returnUrl: freezed == returnUrl ? _self.returnUrl : returnUrl // ignore: cast_nullable_to_non_nullable
as String?,isDesktop: freezed == isDesktop ? _self.isDesktop : isDesktop // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$SaleInfo {

@JsonKey(name: "CardNameSurname") String? get cardNameSurname;@JsonKey(name: "CardNumber") String? get cardNumber;@JsonKey(name: "CardExpiryDateMonth") int? get cardExpiryDateMonth;@JsonKey(name: "CardExpiryDateYear") int? get cardExpiryDateYear;@JsonKey(name: "CardCVV") String? get cardCvv;@JsonKey(name: "Currency") int? get currency;@JsonKey(name: "Amount") int? get amount;@JsonKey(name: "Point") String? get point;@JsonKey(name: "Installment") int? get installment;@JsonKey(name: "CampaignCode") String? get campaignCode;@JsonKey(name: "BankCode") String? get bankCode;@JsonKey(name: "Description") String? get description;
/// Create a copy of SaleInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleInfoCopyWith<SaleInfo> get copyWith => _$SaleInfoCopyWithImpl<SaleInfo>(this as SaleInfo, _$identity);

  /// Serializes this SaleInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleInfo&&(identical(other.cardNameSurname, cardNameSurname) || other.cardNameSurname == cardNameSurname)&&(identical(other.cardNumber, cardNumber) || other.cardNumber == cardNumber)&&(identical(other.cardExpiryDateMonth, cardExpiryDateMonth) || other.cardExpiryDateMonth == cardExpiryDateMonth)&&(identical(other.cardExpiryDateYear, cardExpiryDateYear) || other.cardExpiryDateYear == cardExpiryDateYear)&&(identical(other.cardCvv, cardCvv) || other.cardCvv == cardCvv)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.point, point) || other.point == point)&&(identical(other.installment, installment) || other.installment == installment)&&(identical(other.campaignCode, campaignCode) || other.campaignCode == campaignCode)&&(identical(other.bankCode, bankCode) || other.bankCode == bankCode)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardNameSurname,cardNumber,cardExpiryDateMonth,cardExpiryDateYear,cardCvv,currency,amount,point,installment,campaignCode,bankCode,description);



}

/// @nodoc
abstract mixin class $SaleInfoCopyWith<$Res>  {
  factory $SaleInfoCopyWith(SaleInfo value, $Res Function(SaleInfo) _then) = _$SaleInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "CardNameSurname") String? cardNameSurname,@JsonKey(name: "CardNumber") String? cardNumber,@JsonKey(name: "CardExpiryDateMonth") int? cardExpiryDateMonth,@JsonKey(name: "CardExpiryDateYear") int? cardExpiryDateYear,@JsonKey(name: "CardCVV") String? cardCvv,@JsonKey(name: "Currency") int? currency,@JsonKey(name: "Amount") int? amount,@JsonKey(name: "Point") String? point,@JsonKey(name: "Installment") int? installment,@JsonKey(name: "CampaignCode") String? campaignCode,@JsonKey(name: "BankCode") String? bankCode,@JsonKey(name: "Description") String? description
});




}
/// @nodoc
class _$SaleInfoCopyWithImpl<$Res>
    implements $SaleInfoCopyWith<$Res> {
  _$SaleInfoCopyWithImpl(this._self, this._then);

  final SaleInfo _self;
  final $Res Function(SaleInfo) _then;

/// Create a copy of SaleInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cardNameSurname = freezed,Object? cardNumber = freezed,Object? cardExpiryDateMonth = freezed,Object? cardExpiryDateYear = freezed,Object? cardCvv = freezed,Object? currency = freezed,Object? amount = freezed,Object? point = freezed,Object? installment = freezed,Object? campaignCode = freezed,Object? bankCode = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
cardNameSurname: freezed == cardNameSurname ? _self.cardNameSurname : cardNameSurname // ignore: cast_nullable_to_non_nullable
as String?,cardNumber: freezed == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String?,cardExpiryDateMonth: freezed == cardExpiryDateMonth ? _self.cardExpiryDateMonth : cardExpiryDateMonth // ignore: cast_nullable_to_non_nullable
as int?,cardExpiryDateYear: freezed == cardExpiryDateYear ? _self.cardExpiryDateYear : cardExpiryDateYear // ignore: cast_nullable_to_non_nullable
as int?,cardCvv: freezed == cardCvv ? _self.cardCvv : cardCvv // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as int?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,point: freezed == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as String?,installment: freezed == installment ? _self.installment : installment // ignore: cast_nullable_to_non_nullable
as int?,campaignCode: freezed == campaignCode ? _self.campaignCode : campaignCode // ignore: cast_nullable_to_non_nullable
as String?,bankCode: freezed == bankCode ? _self.bankCode : bankCode // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SaleInfo extends SaleInfo {
   _SaleInfo({@JsonKey(name: "CardNameSurname") this.cardNameSurname, @JsonKey(name: "CardNumber") this.cardNumber, @JsonKey(name: "CardExpiryDateMonth") this.cardExpiryDateMonth, @JsonKey(name: "CardExpiryDateYear") this.cardExpiryDateYear, @JsonKey(name: "CardCVV") this.cardCvv, @JsonKey(name: "Currency") this.currency, @JsonKey(name: "Amount") this.amount, @JsonKey(name: "Point") this.point, @JsonKey(name: "Installment") this.installment, @JsonKey(name: "CampaignCode") this.campaignCode, @JsonKey(name: "BankCode") this.bankCode, @JsonKey(name: "Description") this.description}): super._();
  factory _SaleInfo.fromJson(Map<String, dynamic> json) => _$SaleInfoFromJson(json);

@override@JsonKey(name: "CardNameSurname") final  String? cardNameSurname;
@override@JsonKey(name: "CardNumber") final  String? cardNumber;
@override@JsonKey(name: "CardExpiryDateMonth") final  int? cardExpiryDateMonth;
@override@JsonKey(name: "CardExpiryDateYear") final  int? cardExpiryDateYear;
@override@JsonKey(name: "CardCVV") final  String? cardCvv;
@override@JsonKey(name: "Currency") final  int? currency;
@override@JsonKey(name: "Amount") final  int? amount;
@override@JsonKey(name: "Point") final  String? point;
@override@JsonKey(name: "Installment") final  int? installment;
@override@JsonKey(name: "CampaignCode") final  String? campaignCode;
@override@JsonKey(name: "BankCode") final  String? bankCode;
@override@JsonKey(name: "Description") final  String? description;

/// Create a copy of SaleInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleInfoCopyWith<_SaleInfo> get copyWith => __$SaleInfoCopyWithImpl<_SaleInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaleInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleInfo&&(identical(other.cardNameSurname, cardNameSurname) || other.cardNameSurname == cardNameSurname)&&(identical(other.cardNumber, cardNumber) || other.cardNumber == cardNumber)&&(identical(other.cardExpiryDateMonth, cardExpiryDateMonth) || other.cardExpiryDateMonth == cardExpiryDateMonth)&&(identical(other.cardExpiryDateYear, cardExpiryDateYear) || other.cardExpiryDateYear == cardExpiryDateYear)&&(identical(other.cardCvv, cardCvv) || other.cardCvv == cardCvv)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.point, point) || other.point == point)&&(identical(other.installment, installment) || other.installment == installment)&&(identical(other.campaignCode, campaignCode) || other.campaignCode == campaignCode)&&(identical(other.bankCode, bankCode) || other.bankCode == bankCode)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardNameSurname,cardNumber,cardExpiryDateMonth,cardExpiryDateYear,cardCvv,currency,amount,point,installment,campaignCode,bankCode,description);



}

/// @nodoc
abstract mixin class _$SaleInfoCopyWith<$Res> implements $SaleInfoCopyWith<$Res> {
  factory _$SaleInfoCopyWith(_SaleInfo value, $Res Function(_SaleInfo) _then) = __$SaleInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "CardNameSurname") String? cardNameSurname,@JsonKey(name: "CardNumber") String? cardNumber,@JsonKey(name: "CardExpiryDateMonth") int? cardExpiryDateMonth,@JsonKey(name: "CardExpiryDateYear") int? cardExpiryDateYear,@JsonKey(name: "CardCVV") String? cardCvv,@JsonKey(name: "Currency") int? currency,@JsonKey(name: "Amount") int? amount,@JsonKey(name: "Point") String? point,@JsonKey(name: "Installment") int? installment,@JsonKey(name: "CampaignCode") String? campaignCode,@JsonKey(name: "BankCode") String? bankCode,@JsonKey(name: "Description") String? description
});




}
/// @nodoc
class __$SaleInfoCopyWithImpl<$Res>
    implements _$SaleInfoCopyWith<$Res> {
  __$SaleInfoCopyWithImpl(this._self, this._then);

  final _SaleInfo _self;
  final $Res Function(_SaleInfo) _then;

/// Create a copy of SaleInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cardNameSurname = freezed,Object? cardNumber = freezed,Object? cardExpiryDateMonth = freezed,Object? cardExpiryDateYear = freezed,Object? cardCvv = freezed,Object? currency = freezed,Object? amount = freezed,Object? point = freezed,Object? installment = freezed,Object? campaignCode = freezed,Object? bankCode = freezed,Object? description = freezed,}) {
  return _then(_SaleInfo(
cardNameSurname: freezed == cardNameSurname ? _self.cardNameSurname : cardNameSurname // ignore: cast_nullable_to_non_nullable
as String?,cardNumber: freezed == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String?,cardExpiryDateMonth: freezed == cardExpiryDateMonth ? _self.cardExpiryDateMonth : cardExpiryDateMonth // ignore: cast_nullable_to_non_nullable
as int?,cardExpiryDateYear: freezed == cardExpiryDateYear ? _self.cardExpiryDateYear : cardExpiryDateYear // ignore: cast_nullable_to_non_nullable
as int?,cardCvv: freezed == cardCvv ? _self.cardCvv : cardCvv // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as int?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,point: freezed == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as String?,installment: freezed == installment ? _self.installment : installment // ignore: cast_nullable_to_non_nullable
as int?,campaignCode: freezed == campaignCode ? _self.campaignCode : campaignCode // ignore: cast_nullable_to_non_nullable
as String?,bankCode: freezed == bankCode ? _self.bankCode : bankCode // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
