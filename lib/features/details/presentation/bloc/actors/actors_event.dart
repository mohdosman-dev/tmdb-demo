import 'package:equatable/equatable.dart';

//* BloC actors events
abstract class IActorsEvent extends Equatable {
  const IActorsEvent();

  @override
  List<Object> get props => [];
}

/// Get actors event
/// (Emit when start fetching actors)
class GetActorsEvent extends IActorsEvent {
  final int id;

  const GetActorsEvent(this.id);
}

/// Get actors event
/// (Emit when pull refresh indicator)
class GetActorsRefreshEvent extends IActorsEvent {
  /// Pull to Refresh Indicator
  final int id;

  const GetActorsRefreshEvent(this.id);
}
