import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class OpenFoodItemDetails extends Equatable {
  final String productName;
  final List<String> storesTags;

  OpenFoodItemDetails({
    @required this.productName,
    @required this.storesTags,
  }) : super([productName, storesTags]);
}
