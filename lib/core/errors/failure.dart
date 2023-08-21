import 'package:equatable/equatable.dart';

abstract class IFailure extends Equatable {
  late final String? message;
  late final int? code;
}

//! Client side failure (Offline)
class OfflineFailure extends IFailure {
  final String? offlineMessage;
  @override
  final int? code;
  OfflineFailure(this.offlineMessage, {this.code});

  @override
  List<Object?> get props => [];
}

//! Server side failure
class ServerFailure extends IFailure {
  //* Message to describe what's going on
  final String serverMessage;
  @override
  final int? code;

  ServerFailure(this.serverMessage, {this.code});

  @override
  List<Object?> get props => [];
}
