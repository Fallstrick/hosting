import 'package:fallstrick_hosting/src/server/i_server.dart';
import 'package:fallstrick_hosting/src/web_host/configure.dart';

import 'i_web_host.dart';

abstract class IWebHostBuilder{
  IWebHostBuilder useServer(IServer server);
  IWebHostBuilder configure(MiddlewareConfigure configure);
  IWebHost build();
}