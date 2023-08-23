// Interface to define datasource function
import 'package:tmdb_demo/core/helpers/dio_helper.dart';

abstract class IFavouriteDatasource {}

// Interface to fetch data from remote datasource
class RemoteFavouriteDatasource extends IFavouriteDatasource {
  final DioHelper dioHelper;

  RemoteFavouriteDatasource(this.dioHelper);
}
