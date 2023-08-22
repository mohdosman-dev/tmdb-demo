import 'package:equatable/equatable.dart';
import 'package:tmdb_demo/features/details/data/models/movie_details.dart';

//* BLoC details States
abstract class IDetailsState extends Equatable {
  const IDetailsState();
  @override
  List<Object> get props => [];
}

//* Inital state
class InitalDetailsState extends IDetailsState {}

//* Loading details state
class LoadingDetailsState extends IDetailsState {}

//* After fetch data state
class LoadedDetailsState extends IDetailsState {
  final MovieDetails movieDetails;

  const LoadedDetailsState(this.movieDetails);

  @override
  List<Object> get props => [movieDetails];
}

//* After fetch data and error occured
class ErrorDetailsState extends IDetailsState {
  final String message;

  const ErrorDetailsState(this.message);

  @override
  List<Object> get props => [message];
}
