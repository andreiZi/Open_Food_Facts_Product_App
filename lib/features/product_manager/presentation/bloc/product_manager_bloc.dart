import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_api_test_app/core/error/failures.dart';
import 'package:food_api_test_app/core/util/input_converter.dart';
import 'package:food_api_test_app/features/product_manager/domain/entities/open_food_item.dart';
import 'package:food_api_test_app/features/product_manager/domain/usecases/get_product.dart';

part 'product_manager_event.dart';
part 'product_manager_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';
const String PRODUCT_NOT_FOUND_FAILURE_MESSAGE = "Product not found";

class ProductManagerBloc
    extends Bloc<ProductManagerEvent, ProductManagerState> {
  final GetOpenFoodItem getOpenFoodItem;
  final InputConverter inputConverter;

  ProductManagerBloc(
      {@required GetOpenFoodItem openFoodItem, @required this.inputConverter})
      : assert(openFoodItem != null),
        assert(inputConverter != null),
        getOpenFoodItem = openFoodItem;

  @override
  ProductManagerState get initialState => Empty();

  @override
  Stream<ProductManagerState> mapEventToState(
    ProductManagerEvent event,
  ) async* {
    if (event is GetOpenFoodItemForBarcode) {
      final inputEither =
          inputConverter.stringToUnsignedInteger(event.barcodeString);

      yield* inputEither.fold(
        (failure) async* {
          yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
        },
        (integer) async* {
          yield Loading();
          final failureOrOpenFoodItem =
              await getOpenFoodItem(Params(barCode: integer));
          yield* _eitherLoadedOrErrorState(failureOrOpenFoodItem);
        },
      );
    }
  }

  Stream<ProductManagerState> _eitherLoadedOrErrorState(
      Either<Failure, OpenFoodItem> either) async* {
    yield either.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (openFoodItem) => Loaded(openFoodItem: openFoodItem));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      case ProductNotFoundFailure:
        return PRODUCT_NOT_FOUND_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
