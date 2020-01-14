import 'dart:async';

import 'package:fallstrick_hosting/src/context/http_context.dart';

typedef RequestDelegate = FutureOr<void> Function(HttpContext context);
