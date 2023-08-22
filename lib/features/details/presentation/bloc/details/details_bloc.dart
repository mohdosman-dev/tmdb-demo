import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_demo/core/errors/failure.dart';
import 'package:tmdb_demo/features/details/data/models/movie_details.dart';
import 'package:tmdb_demo/features/details/domain/usecases/get_movie_details_usecase.dart';
import 'package:tmdb_demo/features/details/presentation/bloc/details/details_event.dart';
import 'package:tmdb_demo/features/details/presentation/bloc/details/details_state.dart';

class DetailsBloc extends Bloc<IDetailsEvent, IDetailsState> {
  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  DetailsBloc(this.getMovieDetailsUsecase) : super(InitalDetailsState()) {
    on((event, emit) async {
      if (event is GetDetailsEvent && event.id != -1) {
        //* If current event is get details, then emit loading state
        emit(LoadingDetailsState());

        final result = await getMovieDetailsUsecase.call(event.id);
        emit(_mapArticleOrFailure(result));
      } else if (event is GetDetailsRefreshEvent && event.id != -1) {
        emit(LoadingDetailsState());
        final result = await getMovieDetailsUsecase.call(event.id);
        emit(_mapArticleOrFailure(result));
      } else {
        emit(const ErrorDetailsState('Cannot load details'));
      }
    });
  }

  IDetailsState _mapArticleOrFailure(Either<MovieDetails, IFailure> either) {
    return either.fold(
      (r) => LoadedDetailsState(r),
      (l) => ErrorDetailsState(l.message ?? 'Something went wrong'),
    );
  }
}
