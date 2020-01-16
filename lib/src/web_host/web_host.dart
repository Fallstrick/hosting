import 'package:fallstrick_hosting/src/delegate/request_delegate.dart';
import 'package:fallstrick_hosting/src/server/i_server.dart';
import 'package:fallstrick_hosting/src/web_host/i_web_host.dart';

/// [WebHost] is the host for Fallstrick app
class WebHost implements IWebHost {
  /// Fallstrick app's server
  IServer _server;

  /// [RequestDelegate] for Fallstrick app
  RequestDelegate _handler;

  WebHost(IServer server, RequestDelegate handler) {
    _server = server;
    _handler = handler;
  }

  ///  Start [WebHost]
  @override
  Future run() => _server.runAsync(_handler);
}
