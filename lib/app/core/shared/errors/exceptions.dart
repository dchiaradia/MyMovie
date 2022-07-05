import 'dart:convert';

import 'package:equatable/equatable.dart';

class DefaultException extends Equatable implements Exception {
  String title;
  String description;
  DefaultException({
    required this.title,
    required this.description,
  });
  @override
  List<Object?> get props => [title, description];

  toJson() {
    return jsonEncode(props);
  }
}

class ServerException extends Equatable implements Exception {
  @override
  List<Object?> get props => [];
}
