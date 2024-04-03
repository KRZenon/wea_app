import 'package:dartz/dartz.dart';

abstract class FailureUseCase<Type, Params> {
  Future<Either<String, Type>> call(Params params);
}