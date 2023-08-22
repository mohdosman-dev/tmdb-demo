import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_demo/core/errors/failure.dart';
import 'package:tmdb_demo/features/home/data/models/genre.dart';
import 'package:tmdb_demo/features/home/domain/usecases/get_genres_usecase.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/genre/genre_event.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/genre/genre_state.dart';

class GenreBloc extends Bloc<IGenreEvent, IGenreState> {
  final GetGenresUsecase getGenreUsecase;
  GenreBloc(this.getGenreUsecase) : super(InitalGenreState()) {
    on((event, emit) async {
      if (event is GetGenresEvent) {
        //* If current event is get articles, then emit loading state
        emit(LoadingGenreState());

        final result = await getGenreUsecase.call();
        emit(_mapArticleOrFailure(result));
      } else if (event is GetGenresRefreshEvent) {
        emit(LoadingGenreState());
        final result = await getGenreUsecase.call();
        emit(_mapArticleOrFailure(result));
      }
    });
  }

  IGenreState _mapArticleOrFailure(Either<List<Genre>, IFailure> either) {
    return either.fold(
      (r) => LoadedGenreState(r),
      (l) => ErrorGenreState(l.message ?? 'Something went wrong'),
    );
  }
}
