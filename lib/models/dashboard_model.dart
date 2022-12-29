
import 'package:floor/floor.dart';

class DashBoardData {
  bool? isSuccessful;
  DashBoardDetails? data;
  String? message;

  DashBoardData({this.isSuccessful,  this.data, this.message});

  DashBoardData.fromJson(Map<String, dynamic> json) {
    if(json["isSuccessful"] is bool) {
      isSuccessful = json["isSuccessful"];
    }
    if(json["data"] is Map) {
      data = (json["data"] == null ? null : DashBoardDetails.fromJson(json["data"]))!;
    }
    if(json["message"] is String) {
      message = json["message"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["isSuccessful"] = isSuccessful;
    _data["data"] = data?.toJson();
    _data["message"] = message;
    return _data;
  }
}
@entity
class DashBoardDetails  {
  @primaryKey int? id ;
  int? total;
  int? assigned;
  int? inProgress;
  int? cancelled;

  DashBoardDetails({this.total, this.assigned, this.inProgress, this.cancelled});

  DashBoardDetails.fromJson(Map<String, dynamic> json) {
    if(json["total"] is int) {
      total = json["total"];
    }
    if(json["assigned"] is int) {
      assigned = json["assigned"];
    }
    if(json["in_progress"] is int) {
      inProgress = json["in_progress"];
    }
    if(json["cancelled"] is int) {
      cancelled = json["cancelled"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["total"] = total;
    _data["assigned"] = assigned;
    _data["in_progress"] = inProgress;
    _data["cancelled"] = cancelled;
    return _data;
  }
}