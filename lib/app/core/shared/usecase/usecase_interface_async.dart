import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failure.dart';

abstract class UsecaseAsync<Output, Input> {
  Either<Failure, Output> call(Input params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
