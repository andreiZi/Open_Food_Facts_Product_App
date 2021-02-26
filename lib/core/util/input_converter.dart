import 'package:dartz/dartz.dart';
import 'package:food_api_test_app/core/error/failures.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String str) {
    try {
      final integer = int.parse(str);
      if (integer < 0) throw FormatException();
      return Right(int.parse(str));
    } on FormatException {
      return Left(InvalidInputfailure());
    }
  }
}

class InvalidInputfailure extends Failure {}
