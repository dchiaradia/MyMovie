import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class CardAlreadyExistsFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UserAlreadyExistsFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerRepeatedFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class MapBoxGetReverseLocationFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class MapBoxGetPolyLineFailure extends Failure {
  @override
  List<Object?> get props => [];
}
