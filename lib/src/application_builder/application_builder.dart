import 'package:fallstrick_hosting/src/application_builder/i_application_builder.dart';
import 'package:fallstrick_hosting/src/context/http_context.dart';
import 'package:fallstrick_hosting/src/delegate/request_delegate.dart';
import 'package:fallstrick_hosting/src/middleware/middleware.dart';

/// Can  build app Fallstrick by [ApplicationBuilder]
class ApplicationBuilder implements IApplicationBuilder {
  /// [Middleware] collection
  List<Middleware> _middlewareList = [];

  /// Method to build a Fallstrick app
  @override
  RequestDelegate build() {
    /// to order FIFO
    _middlewareList = _middlewareList.reversed.toList();
    return (httpContext) {
      RequestDelegate defaultMiddleware(HttpContext _httpContext) {
        return (_httpContext) {
          _httpContext.response.statusCode = 404;
        };
      }

      var next = defaultMiddleware;

      _middlewareList.forEach((middleware) {
        next = middleware(next);
      });

      return next(httpContext);
    };
  }

  /// Method to add Middleware for Fallstrick app
  @override
  IApplicationBuilder use(middleware) {
    _middlewareList.add(middleware);
    return this;
  }
}
