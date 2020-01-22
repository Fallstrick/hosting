import 'dart:io';

/// [IHttpRequestFeature] is the interface for [HttpRequestFeature]
abstract class IHttpRequestFeature {
  /// Get method for url in [HttpRequest]
  Uri get url;

  /// Get method for header in [HttpRequest]
  HttpHeaders get headers;

  ///
  String get method;

  /// Get method for body in [HttpRequest]
  Stream get body ;
}

/// [IHttpResponseFeature] is the interface for [HttpResponseFeature]
abstract class IHttpResponseFeature {

  /// Get method for statusCode in [HttpResponse]
  int get statusCode ;

  /// Set method for statusCode in [HttpResponse]
  set statusCode(code);

  /// Get method for header in [HttpResponse]
  HttpHeaders get headers;

  /// Get method for body in [HttpResponse]
  IOSink get body;
}
