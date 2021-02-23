import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:food_api_test_app/features/product_manager/data/datasources/openFood_remote_datasource.dart';
import 'package:food_api_test_app/features/product_manager/data/models/open_food_item_model.dart';
import 'package:food_api_test_app/features/product_manager/domain/entities/open_food_item.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {
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
      final tOpenFoodItemModel = OpenFoodItemModel.fromJson(
          json.decode(fixture('product_barcode_number')));

      test('''should perfom a get GET request on a URL with 
              number being the endpoint and with application/json header''',
          () async {
        //arrange
        setUpMockHttpClientSuccess200();
        //act
        dataSource.getOpenFoodItem(tBarcode);
        //assert
        verify(mockHttpClient.get('http://numbersapi.com/$tBarcode',
            headers: {'Content-Type': 'application/json'}));
      });
    });
  }
}
