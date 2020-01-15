import 'package:fallstrick_hosting/src/application_builder/application_builder.dart';
import 'package:fallstrick_hosting/src/server/http_listener_server.dart';
import 'package:fallstrick_hosting/src/server/i_server.dart';
import 'package:fallstrick_hosting/src/web_host/configure.dart';
import 'package:fallstrick_hosting/src/web_host/i_web_host.dart';
import 'package:fallstrick_hosting/src/web_host/i_web_host_builder.dart';
import 'package:fallstrick_hosting/src/web_host/web_host.dart';

/// To build  to a [WebHost] for Fallstrick app
class WebHostBuilder implements IWebHostBuilder {
  /// [HttpListenerServer] for Fallstrick app
  IServer _server;

  /// MiddlewareConfigure collection
  final List<MiddlewareConfigure> _configures = [];

  /// Method to build [WebHost]
  @override
  IWebHost build() {
    var builder = ApplicationBuilder();
    _configures.forEach((configure) {
      configure(builder);
    });
    return WebHost(_server, builder.build());
  }

  /// Fallstrick's configuration
  /// user to use [Middleware] and so on
  @override
  IWebHostBuilder configure(MiddlewareConfigure configure) {
    _configures.add(configure);
    return this;
  }

  /// Add server to fallstrick app
  @override
  IWebHostBuilder useServer(IServer server) {
    _server = server;
    return this;
  }
}

/// Extension method for [WebHostBuilder] to
/// add [HttpListenerServer] to [WebHost]
extension WebHostBuilderExtension on WebHostBuilder {
  IWebHostBuilder useHttpListener(String address, int port) =>
      useServer(HttpListenerServer(address, port));
}
