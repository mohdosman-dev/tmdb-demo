import 'package:equatable/equatable.dart';
import 'package:tmdb_demo/features/home/data/models/movie.dart';

//* BLoC movie States
abstract class ITrendingState extends Equatable {
  const ITrendingState();
  @override
  List<Object> get props => [];
}

//* Inital state
class InitalTrendingState extends ITrendingState {}

//* Loading movie state
class LoadingTrendingState extends ITrendingState {}

//* After fetch data state
class LoadedTrendingState extends ITrendingState {
  final List<Movie> movies;

  const LoadedTrendingState(this.movies);

  @override
  List<Object> get props => [movies];
}

//* After fetch data and error occured
class ErrorTrendingState extends ITrendingState {
  final String message;

  const ErrorTrendingState(this.message);

  @override
  List<Object> get props => [message];
}
