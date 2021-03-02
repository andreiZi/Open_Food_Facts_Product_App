import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/open_food_item.dart';

abstract class OpenFoodFactsRepository {
  Future<Either<Failure, OpenFoodItem>> getOpenFoodItem(int barcodeNumber);
  Future<Either<Failure, OpenFoodItem>> setProduct(OpenFoodItem openFoodItem);
}
