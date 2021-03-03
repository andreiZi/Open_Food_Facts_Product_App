import 'package:food_api_test_app/features/product_manager/data/datasources/openFood_remote_datasource.dart';
import 'package:food_api_test_app/features/product_manager/data/models/open_food_item_model.dart';
import 'package:food_api_test_app/core/error/exceptions.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  OpenFoodFactsRemoteDataSource dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = OpenFoodFactsRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async =>
            http.Response(fixture('product_barcode_number.json'), 200));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  group('getOpenFoodItem', () {
    final tBarcode = 20035594;
    final tOpenFoodItemModel =
        OpenFoodItemModel.fromJson(fixture('product_barcode_number.json'));

    test('''should perfom a get GET request on a URL with 
              number being the endpoint and with application/json header''',
        () {
      //arrange
      setUpMockHttpClientSuccess200();
      //act
      dataSource.getOpenFoodItem(tBarcode);
      //assert
      verify(mockHttpClient.get(
          'https://world.openfoodfacts.org/api/v0/product/$tBarcode',
          headers: {'Content-Type': 'application/json'}));
    });

    test('should return a OpenFooditem when the response is 200 (success)',
        () async {
      //arrange
      setUpMockHttpClientSuccess200();
      //act
      final result = await dataSource.getOpenFoodItem(tBarcode);
      //assert
      expect(result, equals(tOpenFoodItemModel));
    });

    test(
        '''should throw a ServerException when the response code is 404 or other ''',
        () async {
      //arrange
      setUpMockHttpClientFailure404();
      //act
      final call = dataSource.getOpenFoodItem;
      //assert
      expect(() => call(tBarcode), throwsA(TypeMatcher<ServerException>()));
    });
  });
}
