import 'package:equatable/equatable.dart';

//* BloC trending movies events
abstract class IUpcomingEvent extends Equatable {
  const IUpcomingEvent();

  @override
  List<Object> get props => [];
}

/// Get trending movies event
/// (Emit when start fetching trending moviess)
class GetUpcomingEvent extends IUpcomingEvent {}

/// Get trending movies event
/// (Emit when pull refresh indicator)
class GetUpcomingRefreshEvent extends IUpcomingEvent {}
