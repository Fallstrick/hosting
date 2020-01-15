import 'package:fallstrick_hosting/src/context/feature.dart';
import 'dart:io' as io;

/// [IHttpRequestFeature] is the bridge
/// between [HttpRequest] and [HttpListenerServer]
/// which implements [IHttpRequestFeature]
class HttpRequestFeature implements IHttpRequestFeature {
  /// [_context] is the request of [HttpServer]
  io.HttpRequest _context;

  HttpRequestFeature(io.HttpRequest context) {
    _context = context;
  }

  /// Get [HttpServer]'s [HttpRequest] body to Fallstrick app
  @override
  Stream get body => _context;

  /// Get [HttpServer]'s [HttpRequest] header to Fallstrick app
  @override
  io.HttpHeaders get headers => _context.headers;

  /// Get [HttpServer]'s [HttpRequest] url to Fallstrick app
  @override
  Uri get url => _context.uri;
}

/// [HttpResponseFeature] is the bridge
/// between [HttpResponse] and [HttpListenerServer]
/// which implements [IHttpResponseFeature]
class HttpResponseFeature implements IHttpResponseFeature {
  /// [_context] is the response of [HttpServer]
  io.HttpResponse _context;

  HttpResponseFeature(io.HttpResponse context) {
    _context = context;
  }

  /// Get [HttpServer]'s [HttpRequest] body to Fallstrick app
  @override
  io.IOSink get body => _context;

  /// Get [HttpServer]'s [HttpRequest] headers to Fallstrick app
  @override
  io.HttpHeaders get headers => _context.headers;

  /// Get [HttpServer]'s [HttpRequest] statusCode to Fallstrick app
  @override
  int get statusCode => _context.statusCode;

  /// Set [HttpServer]'s [HttpRequest] statusCode to Fallstrick app
  @override
  set statusCode(code) {
    _context.statusCode = code;
  }
}
