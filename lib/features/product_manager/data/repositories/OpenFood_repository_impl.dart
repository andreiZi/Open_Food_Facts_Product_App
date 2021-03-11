import 'package:flutter/cupertino.dart';
import 'package:food_api_test_app/core/error/exceptions.dart';
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
  Future<Either<Failure, OpenFoodItem>> getOpenFoodItem(
      int barcodeNumber) async {
    if (await networkinfo.isConnected) {
      try {
        final remoteOpenFoodItem =
            await remoteDataSource.getOpenFoodItem(barcodeNumber);
        //TODO: Cache OpenFoodItem when it's get gotten from remote data source
        return (Right(remoteOpenFoodItem));
      } on ServerException {
        return Left(ServerFailure());
      } on ProductNotFoundException {
        return Left(ProductNotFoundFailure());
      }
    }
  }

  @override
  Future<Either<Failure, OpenFoodItem>> setProduct(OpenFoodItem openFoodItem) {
    // TODO: implement setProduct
    throw UnimplementedError();
  }
}
