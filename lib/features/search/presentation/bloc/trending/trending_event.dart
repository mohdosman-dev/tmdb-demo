import 'package:equatable/equatable.dart';

//* BloC trending movies events
abstract class ITrendingEvent extends Equatable {
  const ITrendingEvent();

  @override
  List<Object> get props => [];
}

/// Get trending movies event
/// (Emit when start fetching trending moviess)
class GetTrendingEvent extends ITrendingEvent {}

/// Get trending movies event
/// (Emit when pull refresh indicator)
class GetTrendingRefreshEvent extends ITrendingEvent {}
