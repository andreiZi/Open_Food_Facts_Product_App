part of 'product_manager_bloc.dart';

@immutable
abstract class ProductManagerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetOpenFoodItemForBarcode extends ProductManagerEvent {
  final String barcodeString;

  GetOpenFoodItemForBarcode(this.barcodeString);

  @override
  List<Object> get props => [barcodeString];
}
