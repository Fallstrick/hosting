import 'package:fallstrick_hosting/src/delegate/request_delegate.dart';

/// Interface for [HttpListenerServer]
abstract class IServer {
  /// Run fallstrick app
  Future runAsync(RequestDelegate handler);
}
