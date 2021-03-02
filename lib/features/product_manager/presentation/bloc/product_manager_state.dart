part of 'product_manager_bloc.dart';

@immutable
abstract class ProductManagerState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends ProductManagerState {}

class Loading extends ProductManagerState {}

class Loaded extends ProductManagerState {
  final OpenFoodItem openFoodItem;
  Loaded({@required this.openFoodItem});

  @override
  List<Object> get props => [openFoodItem];
}

class Error extends ProductManagerState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
