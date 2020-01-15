import 'package:fallstrick_hosting/src/delegate/request_delegate.dart';

/// [Middleware] is a method definition
/// which parameters and results are both [RequestDelegate]
typedef Middleware = RequestDelegate Function(RequestDelegate delegate);
