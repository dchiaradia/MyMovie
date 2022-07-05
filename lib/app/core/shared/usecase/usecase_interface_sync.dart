import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failure.dart';

abstract class UsecaseSync<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}

abstract class UsecaseSyncNoParams<Output> {
  Future<Either<Failure, Output>> call();
}

abstract class UsecaseSync2Params<Output, Input, Input2> {
  Future<Either<Failure, Output>> call(Input params, Input2 params2);
}

abstract class UsecaseSync3Params<Output, Input, Input2, Input3> {
  Future<Either<Failure, Output>> call(
      Input params, Input2 params2, Input3 param3);
}

abstract class UsecaseSync4Params<Output, Input, Input2, Input3, Input4> {
  Future<Either<Failure, Output>> call(
      Input params, Input2 params2, Input3 params3, Input4 params4);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
