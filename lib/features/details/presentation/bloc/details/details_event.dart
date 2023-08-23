import 'package:equatable/equatable.dart';

//* BloC details events
abstract class IDetailsEvent extends Equatable {
  const IDetailsEvent();

  @override
  List<Object> get props => [];
}

/// Get details event
/// (Emit when start fetching details)
class GetDetailsEvent extends IDetailsEvent {
  final int id;

  const GetDetailsEvent(this.id);
}

/// Get details event
/// (Emit when pull refresh indicator)
class GetDetailsRefreshEvent extends IDetailsEvent {
  /// Pull to Refresh Indicator
  final int id;

  const GetDetailsRefreshEvent(this.id);
}
