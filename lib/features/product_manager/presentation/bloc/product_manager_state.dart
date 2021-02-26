part of 'product_manager_bloc.dart';

abstract class ProductManagerState extends Equatable {
  const ProductManagerState();
  
  @override
  List<Object> get props => [];
}

class ProductManagerInitial extends ProductManagerState {}
