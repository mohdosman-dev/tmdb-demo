//* BLoC actors States
import 'package:equatable/equatable.dart';
import 'package:tmdb_demo/features/details/data/models/actor.dart';

abstract class IActorsState extends Equatable {
  const IActorsState();
  @override
  List<Object> get props => [];
}

//* Inital state
class InitalActorsState extends IActorsState {}

//* Loading actors state
class LoadingActorsState extends IActorsState {}

//* After fetch data state
class LoadedActorsState extends IActorsState {
  final List<Actor> actors;

  const LoadedActorsState(this.actors);

  @override
  List<Object> get props => [actors];
}

//* After fetch data and error occured
class ErrorActorsState extends IActorsState {
  final String message;

  const ErrorActorsState(this.message);

  @override
  List<Object> get props => [message];
}
