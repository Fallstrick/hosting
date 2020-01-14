import 'package:fallstrick_hosting/src/application_builder/application_builder.dart';
import 'package:fallstrick_hosting/src/application_builder/i_application_builder.dart';
import 'package:fallstrick_hosting/src/server/http_listener_server.dart';
import 'package:fallstrick_hosting/src/server/i_server.dart';
import 'package:fallstrick_hosting/src/web_host/configure.dart';
import 'package:fallstrick_hosting/src/web_host/i_web_host.dart';
import 'package:fallstrick_hosting/src/web_host/i_web_host_builder.dart';
import 'package:fallstrick_hosting/src/web_host/web_host.dart';

class WebHostBuilder implements IWebHostBuilder {
  IServer _server;
  final List<MiddlewareConfigure> _configures = [];

  @override
  IWebHost build() {
    var builder = ApplicationBuilder();
    _configures.forEach((configure) {
      configure(builder);
    });
    return WebHost(_server, builder.build());
  }

  @override
  IWebHostBuilder configure(MiddlewareConfigure configure) {
    _configures.add(configure);
    return this;
  }

  @override
  IWebHostBuilder useServer(IServer server) {
    _server = server;
    return this;
  }
}

extension WebHostBuilderExtension on WebHostBuilder {
  IWebHostBuilder useHttpListener(String address, int port) =>
      useServer(HttpListenerServer(address, port));
}
