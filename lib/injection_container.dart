import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:food_api_test_app/core/network/network_info.dart';
import 'package:http/http.dart' as http;
import 'package:food_api_test_app/core/util/input_converter.dart';
import 'package:food_api_test_app/features/product_manager/data/datasources/openFood_remote_datasource.dart';
import 'package:food_api_test_app/features/product_manager/data/repositories/OpenFood_repository_impl.dart';
import 'package:food_api_test_app/features/product_manager/domain/repositories/OpenFood_repository.dart';
import 'package:food_api_test_app/features/product_manager/domain/usecases/get_product.dart';
import 'package:food_api_test_app/features/product_manager/presentation/bloc/bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
      () => ProductManagerBloc(openFoodItem: sl(), inputConverter: sl()));

// Use cases
  sl.registerLazySingleton(() => GetOpenFoodItem(sl()));

// Repository
  sl.registerLazySingleton<OpenFoodFactsRepository>(
    () => OpenFoodFactsRepositoryImpl(
      networkinfo: sl(),
      remoteDataSource: sl(),
    ),
  );

//Data sources
  sl.registerLazySingleton<OpenFoodFactsRemoteDataSource>(
    () => OpenFoodFactsRemoteDataSourceImpl(
      client: sl(),
    ),
  );

// Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

// External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
