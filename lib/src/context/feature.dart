import 'dart:io';

/// [IHttpRequestFeature] is the interface for [HttpRequestFeature]
abstract class IHttpRequestFeature {
  /// Url in the [HttpRequest]
  Uri _url;

  /// Header in [HttpRequest]
  HttpHeaders _headers;

  /// Body in [HttpRequest]
  Stream _body;

  /// Get method for url in [HttpRequest]
  Uri get url => _url;

  /// Get method for header in [HttpRequest]
  HttpHeaders get headers => _headers;

  /// Get method for body in [HttpRequest]
  Stream get body => _body;
}

/// [IHttpResponseFeature] is the interface for [HttpResponseFeature]
abstract class IHttpResponseFeature {
  /// StatusCode in [HttpResponse]
  int _statusCode;

  /// Header in [HttpResponse]
  HttpHeaders _headers;

  /// Body in [HttpResponse]
  IOSink _body;

  /// Get method for statusCode in [HttpResponse]
  int get statusCode => _statusCode;

  /// Set method for statusCode in [HttpResponse]
  set statusCode(code) {
    _statusCode = code;
  }

  /// Get method for header in [HttpResponse]
  HttpHeaders get headers => _headers;

  /// Get method for body in [HttpResponse]
  IOSink get body => _body;
}
