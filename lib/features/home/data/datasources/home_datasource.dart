// Interface to define datasource function
import 'package:tmdb_demo/core/helpers/dio_helper.dart';

abstract class IHomeDatasource {}

// Interface to fetch data from remote datasource
class RemoteDatasource extends IHomeDatasource {
  final DioHelper dioHelper;

  RemoteDatasource(this.dioHelper);
}
