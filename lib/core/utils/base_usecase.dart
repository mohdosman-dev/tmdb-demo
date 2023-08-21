import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb_demo/core/errors/failure.dart';

// Base usecase (all use casses should implement call function)
abstract class BaseUseCase<Type, Params> {
  Future<Either<Type, IFailure>> call(Params params);
}

// Stream base usecase (all stream usecasses should implement call function)
abstract class StreamBaseUseCase<T, Parameters> {
  Stream<T> call(Parameters parameters);
}

class NoParams extends Equatable {
  const NoParams();
  @override
  List<Object?> get props => [];
}
