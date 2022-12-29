import 'package:floor/floor.dart';

class LoginResponse {
  bool? isSuccessful;
  String? message;
  User? user;
  String? role;

  LoginResponse({this.isSuccessful, this.message, this.user, this.role});
  
  LoginResponse.fromJson(Map<String, dynamic> json)  {
    if(json["isSuccessful"] is bool) {
      isSuccessful = json["isSuccessful"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["user"] is Map) {
      user = json["user"] == null ? null : User.fromJson(json["user"]);
    }
    if(json["role"] is String) {
      role = json["role"];
    }
  }

  Map<String, dynamic> toJson()  {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["isSuccessful"] = isSuccessful;
    _data["message"] = message;
    if(user != null) {
      _data["user"] = user?.toJson();
    }
    _data["role"] = role;
    return _data;
  }
}
@entity
class User {
  @primaryKey
  String? id;
  String? name;
  String? email;
  String? mobile;
  String? roleId;
  int? active;
  bool? isSupervisor;
  bool? isAssigned;
  int? isAccountSetup;
  int? verified;
  String? role;
  bool? orderSelfAssignment;
  bool? orderReturn;


  User({this.id, this.name, this.email, this.mobile, this.roleId, this.active, this.isSupervisor, this.isAssigned, this.isAccountSetup, this.verified, this.role, this.orderSelfAssignment, this.orderReturn});

  User.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["mobile"] is String) {
      mobile = json["mobile"];
    }
    if(json["role_id"] is String) {
      roleId = json["role_id"];
    }
    if(json["active"] is int) {
      active = json["active"];
    }
    if(json["is_supervisor"] is bool) {
      isSupervisor = json["is_supervisor"];
    }
    if(json["is_assigned"] is bool) {
      isAssigned = json["is_assigned"];
    }
    if(json["is_account_setup"] is int) {
      isAccountSetup = json["is_account_setup"];
    }
    if(json["verified"] is int) {
      verified = json["verified"];
    }
    if(json["role"] is String) {
      role = json["role"];
    }
    if(json["order_self_assignment"] is bool) {
      orderSelfAssignment = json["order_self_assignment"];
    }
    if(json["order_return"] is bool) {
      orderReturn = json["order_return"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["mobile"] = mobile;
    _data["role_id"] = roleId;
    _data["active"] = active;
    _data["is_supervisor"] = isSupervisor;
    _data["is_assigned"] = isAssigned;
    _data["is_account_setup"] = isAccountSetup;
    _data["verified"] = verified;
    _data["role"] = role;
    _data["order_self_assignment"] = orderSelfAssignment;
    _data["order_return"] = orderReturn;
    return _data;
  }
}