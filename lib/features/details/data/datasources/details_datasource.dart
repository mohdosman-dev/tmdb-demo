// Interface to define datasource function
import 'package:tmdb_demo/core/helpers/dio_helper.dart';

abstract class IDetailsDatasource {}

// Interface to fetch data from remote datasource
class RemoteDetailsDatasourceImpl extends IDetailsDatasource {
  final DioHelper dioHelper;

  RemoteDetailsDatasourceImpl(this.dioHelper);
}
