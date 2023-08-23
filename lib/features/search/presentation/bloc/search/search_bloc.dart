import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_demo/core/errors/failure.dart';
import 'package:tmdb_demo/features/home/data/models/movie.dart';
import 'package:tmdb_demo/features/search/domain/usecase/search_usecase.dart';
import 'package:tmdb_demo/features/search/presentation/bloc/search/search_event.dart';
import 'package:tmdb_demo/features/search/presentation/bloc/search/search_state.dart';

class SearchBloc extends Bloc<ISearchEvent, ISearchState> {
  final SearchForAMovieUsecase searchUsecase;
// Timer instance

  SearchBloc(this.searchUsecase) : super(InitalSearchState()) {
    on((event, emit) async {
      if (event is GetSearchResultEvent) {
        // if (_searchTimer != null) _searchTimer?.cancel();
        //* If current event is get search result, then emit loading state
        emit(SearchingState());
        // _searchTimer = Timer(const Duration(milliseconds: 500), () async {
        emit(SearchingState());
        final result = await searchUsecase.call({
          "query": event.searchText,
        });
        emit(_mapArticleOrFailure(result));
        // });
      } else if (event is GetSearchResultsRefreshEvent) {
        emit(SearchingState());
        final result = await searchUsecase.call({
          "query": event.searchText,
        });
        emit(_mapArticleOrFailure(result));
      }
    });
  }

  ISearchState _mapArticleOrFailure(Either<List<Movie>, IFailure> either) {
    return either.fold(
      (r) => LoadedSearchResultState(r),
      (l) => ErrorSearchState(l.message ?? 'Something went wrong'),
    );
  }
}
