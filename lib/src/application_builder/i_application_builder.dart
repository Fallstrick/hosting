import 'package:fallstrick_hosting/src/delegate/request_delegate.dart';
import 'package:fallstrick_hosting/src/middleware/middleware.dart';

abstract class IApplicationBuilder {
  IApplicationBuilder use(Middleware middleware);

  RequestDelegate build();
}
