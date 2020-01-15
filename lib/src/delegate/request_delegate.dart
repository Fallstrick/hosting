import 'dart:async';
import 'package:fallstrick_hosting/src/context/http_context.dart';

/// [RequestDelegate] is a method definition with [HttpContext]
typedef RequestDelegate = FutureOr<void> Function(HttpContext context);
