import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_demo/core/errors/failure.dart';
import 'package:tmdb_demo/features/home/data/models/movie.dart';
import 'package:tmdb_demo/features/home/domain/usecases/get_upcoming_movie_usecase.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/trending/trending_event.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/upcoming/upcoming_event.dart';
import 'package:tmdb_demo/features/home/presentation/bloc/upcoming/upcoming_state.dart';

class UpcomingBloc extends Bloc<IUpcomingEvent, IUpcomingState> {
  final GetUpcomingMoviesUsecase getUpcomingUsecase;
  UpcomingBloc(this.getUpcomingUsecase) : super(InitalUpcomingState()) {
    on((event, emit) async {
      if (event is GetUpcomingEvent) {
        //* If current event is get trending movies, then emit loading state
        emit(LoadingUpcomingState());

        final result = await getUpcomingUsecase.call({});
        emit(_mapArticleOrFailure(result));
      } else if (event is GetTrendingRefreshEvent) {
        emit(LoadingUpcomingState());
        final result = await getUpcomingUsecase.call({});
        emit(_mapArticleOrFailure(result));
      }
    });
  }

  IUpcomingState _mapArticleOrFailure(Either<List<Movie>, IFailure> either) {
    return either.fold(
      (r) => LoadedUpcomingState(r),
      (l) => ErrorUpcomingState(l.message ?? 'Something went wrong'),
    );
  }
}
