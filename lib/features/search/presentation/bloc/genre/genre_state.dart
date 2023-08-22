import 'package:equatable/equatable.dart';
import 'package:tmdb_demo/features/home/data/models/genre.dart';

//* BLoC Genre States
abstract class IGenreState extends Equatable {
  const IGenreState();
  @override
  List<Object> get props => [];
}

//* Inital state
class InitalGenreState extends IGenreState {}

//* Loading genre state
class LoadingGenreState extends IGenreState {}

//* After fetch data state
class LoadedGenreState extends IGenreState {
  final List<Genre> genres;

  const LoadedGenreState(this.genres);

  @override
  List<Object> get props => [genres];
}

//* After fetch data and error occured
class ErrorGenreState extends IGenreState {
  final String message;

  const ErrorGenreState(this.message);

  @override
  List<Object> get props => [message];
}
