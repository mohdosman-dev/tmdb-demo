import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class INetworkInfo {
  Future<bool> get isConnected;
}

// Check network status before any request
class NetworkInfoImpl implements INetworkInfo {
  NetworkInfoImpl({required this.dataConnectionChecker});
  final InternetConnectionChecker dataConnectionChecker;
  @override
  Future<bool> get isConnected => dataConnectionChecker.hasConnection;
}
