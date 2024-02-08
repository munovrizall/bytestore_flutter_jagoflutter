import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// 'name' => $request->name,
//             'full_address' => $request->full_address,
//             'phone' => $request->phone,
//             'prov_id' => $request->prov_id,
//             'city_id' => $request->city_id,
//             'district_id' => $request->district_id,
//             'postal_code' => $request->postal_code,
//             'user_id' => $request->user()->id,
//             'is_default' => $request->is_default,

class AddressRequestModel {
  final String? name;
  final String? fullAddress;
  final String? phone;
  final String? provId;
  final String? cityId;
  final String? districtId;
  final String? postalCode;
  final int? isDefault;

  AddressRequestModel({
    this.name,
    this.fullAddress,
    this.phone,
    this.provId,
    this.cityId,
    this.districtId,
    this.postalCode,
    this.isDefault,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'full_address': fullAddress,
      'phone': phone,
      'prov_id': provId,
      'city_id': cityId,
      'district_id': districtId,
      'postal_code': postalCode,
      'is_default': isDefault,
    };
  }

  factory AddressRequestModel.fromMap(Map<String, dynamic> map) {
    return AddressRequestModel(
      name: map['name'] != null ? map['name'] as String : null,
      fullAddress: map['fullAddress'] != null ? map['fullAddress'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      provId: map['provId'] != null ? map['provId'] as String : null,
      cityId: map['cityId'] != null ? map['cityId'] as String : null,
      districtId: map['districtId'] != null ? map['districtId'] as String : null,
      postalCode: map['postalCode'] != null ? map['postalCode'] as String : null,
      isDefault: map['isDefault'] != null ? map['isDefault'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressRequestModel.fromJson(String source) => AddressRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
