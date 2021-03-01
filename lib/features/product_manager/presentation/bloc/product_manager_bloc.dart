import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_api_test_app/core/util/input_converter.dart';
import 'package:food_api_test_app/features/product_manager/domain/usecases/get_product.dart';

part 'product_manager_event.dart';
part 'product_manager_state.dart';

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
  Stream<ProductManagerState> mapEventToState(ProductManagerEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
