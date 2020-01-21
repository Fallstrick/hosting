import 'dart:async';
import 'feature.dart';
import 'feature_collection.dart';
import 'dart:io' as io;

/// [HttpContext] for  Fallstrick app
class HttpContext {
  /// [HttpRequest] in [HttpContext]
  HttpRequest request;

  /// [HttpRequest] in [HttpContext]
  HttpResponse response;

  HttpContext(FeatureCollection features) {
    request = HttpRequest(features);
    response = HttpResponse(features);
  }
}

/// [HttpRequest] for  Fallstrick app
class HttpRequest {
  /// [IHttpRequestFeature] is the bridge
  /// between [HttpRequest] and [HttpListenerServer]
  IHttpRequestFeature _feature;

  /// get method for url in [HttpRequest]
  Uri get url => _feature.url;

  /// get method for header in [HttpRequest]
  io.HttpHeaders get headers => _feature.headers;

  /// get method for body in [HttpRequest]
  Stream get body => _feature.body;

  /// get method for method in [HttpRequest]
  String get method => _feature.method;

  HttpRequest(FeatureCollection features) {
    _feature = features.get<IHttpRequestFeature>();
  }
}

/// [HttpResponse] for  Fallstrick app
class HttpResponse {
  /// [IHttpRequestFeature] is the bridge
  /// between [HttpRequest] and [HttpListenerServer]
  IHttpResponseFeature _feature;

  /// get method for header in [HttpResponse]
  io.HttpHeaders get headers => _feature.headers;

  /// get method for body in [HttpResponse]
  io.IOSink get body => _feature.body;

  /// get method for statusCode in [HttpResponse]
  int get statusCode => _feature.statusCode;

  /// set method for statusCode in [HttpResponse]
  set statusCode(int code) {
    _feature.statusCode = code;
  }

  HttpResponse(FeatureCollection features) {
    _feature = features.get<IHttpResponseFeature>();
  }
}

/// Extension method for [HttpResponse] to output response
extension HttpResponseExtension on HttpResponse {
  Future writeAsync([Object obj = '']) async {
    await body.write(obj);
  }
}
