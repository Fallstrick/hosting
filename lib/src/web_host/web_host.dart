import 'package:fallstrick_hosting/src/delegate/request_delegate.dart';
import 'package:fallstrick_hosting/src/server/i_server.dart';
import 'package:fallstrick_hosting/src/web_host/i_web_host.dart';

class WebHost implements IWebHost {
  IServer _server;
  RequestDelegate _handler;

  WebHost(IServer server, RequestDelegate handler) {
    _server = server;
    _handler = handler;
  }

  @override
  Future run() => _server.runAsync(_handler);
}
