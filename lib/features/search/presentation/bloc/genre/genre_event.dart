import 'package:equatable/equatable.dart';

//* BloC genre events
abstract class IGenreEvent extends Equatable {
  const IGenreEvent();

  @override
  List<Object> get props => [];
}

/// Get genre event
/// (Emit when start fetching genres)
class GetGenresEvent extends IGenreEvent {}

/// Get genre event
/// (Emit when pull refresh indicator)
class GetGenresRefreshEvent extends IGenreEvent {}
