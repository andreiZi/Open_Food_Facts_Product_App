import 'package:flutter/cupertino.dart';
import '../../domain/entities/open_food_item.dart';

class OpenFoodItemModel extends OpenFoodItem {
  OpenFoodItemModel(
      {@required int status,
      @required String statusVerbose,
      @required int barCode})
      : super(status: status, statusVerbose: statusVerbose, barCode: barCode);

  factory OpenFoodItemModel.fromJson(Map<String, dynamic> json) {
    return OpenFoodItemModel(
        status: json['status'],
        statusVerbose: json['status_verbose'],
        barCode:
            json['code'] is String ? int.parse(json['code']) : json['code']);
  }
  // (json['code'] as num).toInt());
  Map<String, dynamic> toJson() {
    return {'status': status, 'status_verbose': statusVerbose, 'code': barCode};
  }
}
