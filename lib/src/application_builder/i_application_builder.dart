import 'package:fallstrick_hosting/src/delegate/request_delegate.dart';
import 'package:fallstrick_hosting/src/middleware/middleware.dart';

/// Interface for [ApplicationBuilder]
abstract class IApplicationBuilder {
  /// Method to add Middleware for Fallstrick app
  IApplicationBuilder use(Middleware middleware);

  /// Method to build a Fallstrick app
  RequestDelegate build();
}
