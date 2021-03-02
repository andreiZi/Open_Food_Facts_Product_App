import 'package:async/async.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_api_test_app/core/error/exceptions.dart';
import 'package:food_api_test_app/core/error/failures.dart';
import 'package:food_api_test_app/core/network/network_info.dart';
import 'package:food_api_test_app/features/product_manager/data/datasources/openFood_remote_datasource.dart';
import 'package:food_api_test_app/features/product_manager/data/models/open_food_item_model.dart';
import 'package:food_api_test_app/features/product_manager/data/repositories/OpenFood_repository_impl.dart';
import 'package:food_api_test_app/features/product_manager/domain/entities/open_food_item.dart';
import 'package:food_api_test_app/features/product_manager/domain/repositories/OpenFood_repository.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock
    implements OpenFoodFactsRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  OpenFoodFactsRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = OpenFoodFactsRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkinfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('getOpenFoodItem', () {
    final tBarcode = 20035594;
    final tOpenFoodItemModel = OpenFoodItemModel(
        barCode: 20035594, status: 1, statusVerbose: 'product found');
    final OpenFoodItem tOpenFoodItem = tOpenFoodItemModel;

    test(
      'should check if the device is online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // act
        repository.getOpenFoodItem(tBarcode);
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          //arrange
          when(mockRemoteDataSource.getOpenFoodItem(any))
              .thenAnswer((_) async => tOpenFoodItemModel);
          //act
          final result = await repository.getOpenFoodItem(tBarcode);
          //assert
          verify(mockRemoteDataSource.getOpenFoodItem(tBarcode));
          expect(result, equals(Right(tOpenFoodItem)));
        },
      );

      //TODO: Write function and test for local cache
      test(
          'should return server failure when teh call to the remote data source is unsuccesful',
          () async {
        //arrange
        when(mockRemoteDataSource.getOpenFoodItem(any))
            .thenThrow(ServerException());
        //act
        final result = await repository.getOpenFoodItem(tBarcode);
        //assert
        verify(mockRemoteDataSource.getOpenFoodItem(tBarcode));
        expect(result, equals(Left(ServerFailure())));
      });
    });
  });

  // TODO: Implement Offline cache functionality and write tests
}
