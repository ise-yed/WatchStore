import 'package:watch_store/data/model/address_model.dart';

class ProfileModel {
  UserInfo? userInfo;
  int? userProcessingCount;
  int? userReceivedCount;
  int? userCancelCount;

  ProfileModel(
      {this.userInfo,
      this.userProcessingCount,
      this.userReceivedCount,
      this.userCancelCount});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    userInfo =
        json['user_info'] != null ? UserInfo.fromJson(json['user_info']) : null;
    userProcessingCount = json['user_processing_count'];
    userReceivedCount = json['user_received_count'];
    userCancelCount = json['user_cancel_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userInfo != null) {
      data['user_info'] = userInfo!.toJson();
    }
    data['user_processing_count'] = userProcessingCount;
    data['user_received_count'] = userReceivedCount;
    data['user_cancel_count'] = userCancelCount;
    return data;
  }
}

class UserInfo {
  int? id;
  String? name;
  String? mobile;
  String? phone;
  AddressModel? address;

  UserInfo({this.id, this.name, this.mobile, this.phone, this.address});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    phone = json['phone'];
    address =
        json['address'] != null ? AddressModel.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mobile'] = mobile;
    data['phone'] = phone;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    return data;
  }
}
