
import 'package:floor/floor.dart';

class OrdersDetails {
  bool? success;
  bool? isSuccessful;
  List<Data>? data;
  String? message;

  OrdersDetails({this.success, this.isSuccessful, this.data, this.message});

  OrdersDetails.fromJson(Map<String, dynamic> json) {
    if(json["success"] is bool) {
      success = json["success"];
    }
    if(json["isSuccessful"] is bool) {
      isSuccessful = json["isSuccessful"];
    }
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
    if(json["message"] is String) {
      message = json["message"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["isSuccessful"] = isSuccessful;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["message"] = message;
    return _data;
  }
}

@entity
class Data {
  @primaryKey
  String? id;
  String? referenceNo;
  String? orderType;
  String? pickupLocation;
  String? dropoffLocation;
  String? placedTime;
  String? status;
  String? assignedTime;
  String? pickedTime;
  String? reachedTime;
  String? deliveredTime;
  String? cancelledTime;

  Data({this.id, this.referenceNo, this.orderType, this.pickupLocation, this.dropoffLocation, this.placedTime, this.status, this.assignedTime, this.pickedTime, this.reachedTime, this.deliveredTime, this.cancelledTime});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["reference_no"] is String) {
      referenceNo = json["reference_no"];
    }
    if(json["order_type"] is String) {
      orderType = json["order_type"];
    }
    if(json["pickup_location"] is String) {
      pickupLocation = json["pickup_location"];
    }
    if(json["dropoff_location"] is String) {
      dropoffLocation = json["dropoff_location"];
    }
    if(json["placed_time"] is String) {
      placedTime = json["placed_time"];
    }
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["assigned_time"] is String) {
      assignedTime = json["assigned_time"];
    }
    pickedTime = json["picked_time"];
    reachedTime = json["reached_time"];
    deliveredTime = json["delivered_time"];
    cancelledTime = json["cancelled_time"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["reference_no"] = referenceNo;
    _data["order_type"] = orderType;
    _data["pickup_location"] = pickupLocation;
    _data["dropoff_location"] = dropoffLocation;
    _data["placed_time"] = placedTime;
    _data["status"] = status;
    _data["assigned_time"] = assignedTime;
    _data["picked_time"] = pickedTime;
    _data["reached_time"] = reachedTime;
    _data["delivered_time"] = deliveredTime;
    _data["cancelled_time"] = cancelledTime;
    return _data;
  }
}