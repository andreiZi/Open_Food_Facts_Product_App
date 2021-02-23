import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:food_api_test_app/features/product_manager/domain/entities/open_food_item.dart';
import 'package:food_api_test_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:food_api_test_app/features/product_manager/domain/repositories/OpenFood_repository.dart';

class OpenFoodFactsRepositoryImpl implements OpenFoodFactsRepository {
  final OpenFoodFactsRemoteDataSource remoteDataSource;
  final OpenFoodFactsLocalDataSource localDataSource;
  final NetworkInfo networkinfo;

  OpenFoodFactsRepositoryImpl(
      {@required this.remoteDataSource,
      @required this.localDataSource,
      @required this.networkinfo});

  @override
  Future<Either<Failure, OpenFoodItem>> getProduct(int barcodeNumber) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OpenFoodItem>> setProduct(OpenFoodItem openFoodItem) {
    // TODO: implement setProduct
    throw UnimplementedError();
  }
}
