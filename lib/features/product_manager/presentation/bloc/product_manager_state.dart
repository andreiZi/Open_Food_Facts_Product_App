part of 'product_manager_bloc.dart';

@immutable
abstract class ProductManagerState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends ProductManagerState {}

class ProductManagerInitial extends ProductManagerState {}
