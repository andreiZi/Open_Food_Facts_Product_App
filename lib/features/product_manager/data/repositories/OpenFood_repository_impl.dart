import 'package:flutter/cupertino.dart';
import 'package:food_api_test_app/core/network/network_info.dart';
import 'package:food_api_test_app/features/product_manager/data/datasources/openFood_remote_datasource.dart';
import 'package:food_api_test_app/features/product_manager/domain/entities/open_food_item.dart';
import 'package:food_api_test_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:food_api_test_app/features/product_manager/domain/repositories/OpenFood_repository.dart';

class OpenFoodFactsRepositoryImpl implements OpenFoodFactsRepository {
  final OpenFoodFactsRemoteDataSource remoteDataSource;
  final NetworkInfo networkinfo;

  OpenFoodFactsRepositoryImpl(
      {@required this.remoteDataSource, @required this.networkinfo});

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
