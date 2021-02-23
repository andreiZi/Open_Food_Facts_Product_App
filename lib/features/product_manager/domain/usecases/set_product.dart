import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_api_test_app/core/error/failures.dart';
import 'package:food_api_test_app/features/product_manager/domain/repositories/OpenFood_repository.dart';
import '../entities/open_food_item.dart';
import '../../../../core/usecases/usecase.dart';

class SetOpenFoodItem extends UseCase<OpenFoodItem, Params> {
  final OpenFoodFactsRepository repository;

  SetOpenFoodItem(this.repository);

  @override
  Future<Either<Failure, OpenFoodItem>> call(Params params) {
    return repository.setProduct(params.openFoodItem);
  }
}

class Params extends Equatable {
  final OpenFoodItem openFoodItem;

  Params({@required this.openFoodItem}) : super([openFoodItem]);
}
