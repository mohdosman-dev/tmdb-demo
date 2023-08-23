import 'package:equatable/equatable.dart';
import 'package:tmdb_demo/features/home/data/models/movie.dart';

//* BLoC upcoming movie States
abstract class IUpcomingState extends Equatable {
  const IUpcomingState();
  @override
  List<Object> get props => [];
}

//* Inital state
class InitalUpcomingState extends IUpcomingState {}

//* Loading upcoming movie state
class LoadingUpcomingState extends IUpcomingState {}

//* After fetch data state
class LoadedUpcomingState extends IUpcomingState {
  final List<Movie> movies;

  const LoadedUpcomingState(this.movies);

  @override
  List<Object> get props => [movies];
}

//* After fetch data and error occured
class ErrorUpcomingState extends IUpcomingState {
  final String message;

  const ErrorUpcomingState(this.message);

  @override
  List<Object> get props => [message];
}
