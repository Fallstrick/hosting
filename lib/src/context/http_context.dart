import 'dart:async';

import 'feature.dart';
import 'feature_collection.dart';
import 'dart:io' as io;

class HttpContext {
  //http request object
  HttpRequest request;

  //http response object
  HttpResponse response;

  HttpContext(FeatureCollection features)
  {
    request = HttpRequest(features);
    response = HttpResponse(features);
  }
}

class HttpRequest {
  IHttpRequestFeature _feature;

  Uri get url => _feature.url;

  io.HttpHeaders get headers => _feature.headers;

  Stream get body => _feature.body;

  HttpRequest(FeatureCollection features) {
    _feature = features.get<IHttpRequestFeature>();
  }
}

class HttpResponse {
  IHttpResponseFeature _feature;

  HttpResponse(FeatureCollection features) {
    _feature = features.get<IHttpResponseFeature>();
  }

  io.HttpHeaders get headers => _feature.headers;

  io.IOSink get body => _feature.body;

  int get statusCode => _feature.statusCode;

  set statusCode(int code) {
    _feature.statusCode = code;
  }
}

extension HttpResponseExtension on HttpResponse {
  Future writeAsync(String contents) async {
    await body.write(contents);
  }
}
