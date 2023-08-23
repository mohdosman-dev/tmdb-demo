import 'package:equatable/equatable.dart';

//* BloC genre events
abstract class ISearchEvent extends Equatable {
  const ISearchEvent();

  @override
  List<Object> get props => [];
}

/// Get genre event
/// (Emit when start fetching genres)
class GetSearchResultEvent extends ISearchEvent {
  final String searchText;

  const GetSearchResultEvent(this.searchText);

  @override
  List<Object> get props => [searchText];
}

/// Get genre event
/// (Emit when pull refresh indicator)
class GetSearchResultsRefreshEvent extends ISearchEvent {
  final String searchText;

  const GetSearchResultsRefreshEvent(this.searchText);

  @override
  List<Object> get props => [searchText];
}
