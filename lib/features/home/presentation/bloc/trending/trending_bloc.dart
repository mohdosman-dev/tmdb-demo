import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_demo/core/errors/failure.dart';
import 'package:tmdb_demo/features/home/data/models/movie.dart';
import 'package:tmdb_demo/features/home/domain/usecases/get_trending_movie_usecase.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/trending/trending_event.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/trending/trending_state.dart';

class TrendingBloc extends Bloc<ITrendingEvent, ITrendingState> {
  final GetTrendingMoviesUsecase getTrendingUsecase;
  TrendingBloc(this.getTrendingUsecase) : super(InitalTrendingState()) {
    on((event, emit) async {
      if (event is GetTrendingEvent) {
        //* If current event is get trending movies, then emit loading state
        emit(LoadingTrendingState());

        final result = await getTrendingUsecase.call({});
        emit(_mapArticleOrFailure(result));
      } else if (event is GetTrendingRefreshEvent) {
        emit(LoadingTrendingState());
        final result = await getTrendingUsecase.call({});
        emit(_mapArticleOrFailure(result));
      }
    });
  }

  ITrendingState _mapArticleOrFailure(Either<List<Movie>, IFailure> either) {
    return either.fold(
      (r) => LoadedTrendingState(r),
      (l) => ErrorTrendingState(l.message ?? 'Something went wrong'),
    );
  }
}
