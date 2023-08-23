import 'package:equatable/equatable.dart';
import 'package:tmdb_demo/features/home/data/models/movie.dart';

//* BLoC Search States
abstract class ISearchState extends Equatable {
  const ISearchState();
  @override
  List<Object> get props => [];
}

//* Inital state
class InitalSearchState extends ISearchState {}

//* Loading search state
class SearchingState extends ISearchState {}

//* After fetch data state
class LoadedSearchResultState extends ISearchState {
  final List<Movie> results;

  const LoadedSearchResultState(this.results);

  @override
  List<Object> get props => [results];
}

//* After fetch data and error occured
class ErrorSearchState extends ISearchState {
  final String message;

  const ErrorSearchState(this.message);

  @override
  List<Object> get props => [message];
}
