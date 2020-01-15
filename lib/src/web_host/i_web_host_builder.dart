import 'package:fallstrick_hosting/src/server/i_server.dart';
import 'package:fallstrick_hosting/src/web_host/configure.dart';

import 'i_web_host.dart';

/// Interface for [WebHostBuilder]
abstract class IWebHostBuilder {
  /// Add server to fallstrick app
  IWebHostBuilder useServer(IServer server);

  /// Fallstrick's configuration
  IWebHostBuilder configure(MiddlewareConfigure configure);

  /// Method to build [WebHost]
  IWebHost build();
}
