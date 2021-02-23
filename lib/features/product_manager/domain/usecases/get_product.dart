import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_api_test_app/core/error/failures.dart';
import 'package:food_api_test_app/core/usecases/usecase.dart';
import 'package:food_api_test_app/features/product_manager/domain/entities/open_food_item.dart';
import 'package:food_api_test_app/features/product_manager/domain/repositories/OpenFood_repository.dart';

class GetOpenFoodItem extends UseCase<OpenFoodItem, Params> {
  final OpenFoodFactsRepository repository;

  GetOpenFoodItem(this.repository);

  @override
  Future<Either<Failure, OpenFoodItem>> call(Params params) async {
    return await repository.getProduct(params.barCode);
  }
}

class Params extends Equatable {
  final int barCode;

  Params({@required this.barCode}) : super([barCode]);
}
