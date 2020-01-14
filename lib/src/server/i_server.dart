import 'package:fallstrick_hosting/src/delegate/request_delegate.dart';

abstract class IServer {
  Future runAsync(RequestDelegate handler);
}