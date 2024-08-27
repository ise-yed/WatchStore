
class AddressModel {
  String? address;
  String? lat;
  String? lng;
  String? postalCode;

  AddressModel({this.address, this.lat, this.lng, this.postalCode});

  AddressModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    lat = json['lat'];
    lng = json['lng'];
    postalCode = json['postal_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['lat'] = lat;
    data['lng'] = lng;
    data['postal_code'] = postalCode;
    return data;
  }
}