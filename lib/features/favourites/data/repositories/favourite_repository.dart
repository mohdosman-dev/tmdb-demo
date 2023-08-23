import 'package:tmdb_demo/features/favourites/data/datasources/favourite_datasource.dart';
import 'package:tmdb_demo/features/favourites/domain/repositories/i_favourite_repository.dart';

// The implementation for remote repository
class RemoteHomeRepository extends IFavouriteRepository {
  final IFavouriteDatasource datasource;

  RemoteHomeRepository(this.datasource);
}
