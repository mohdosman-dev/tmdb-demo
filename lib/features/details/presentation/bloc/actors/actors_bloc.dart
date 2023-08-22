import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_demo/core/errors/failure.dart';
import 'package:tmdb_demo/features/details/data/models/actor.dart';
import 'package:tmdb_demo/features/details/domain/usecases/get_movie_actors_usecase.dart';
import 'package:tmdb_demo/features/details/presentation/bloc/actors/actors_event.dart';
import 'package:tmdb_demo/features/details/presentation/bloc/actors/actors_state.dart';

class ActorsBloc extends Bloc<IActorsEvent, IActorsState> {
  final GetMovieActorsUsecase getMovieActorsUsecase;
  ActorsBloc(this.getMovieActorsUsecase) : super(InitalActorsState()) {
    on((event, emit) async {
      if (event is GetActorsEvent && event.id != -1) {
        //* If current event is get details, then emit loading state
        emit(LoadingActorsState());

        final result = await getMovieActorsUsecase.call(event.id);
        emit(_mapArticleOrFailure(result));
      } else if (event is GetActorsRefreshEvent && event.id != -1) {
        emit(LoadingActorsState());
        final result = await getMovieActorsUsecase.call(event.id);
        emit(_mapArticleOrFailure(result));
      } else {
        emit(const ErrorActorsState('Cannot load details'));
      }
    });
  }

  IActorsState _mapArticleOrFailure(Either<List<Actor>, IFailure> either) {
    return either.fold(
      (r) => LoadedActorsState(r),
      (l) => ErrorActorsState(l.message ?? 'Something went wrong'),
    );
  }
}
