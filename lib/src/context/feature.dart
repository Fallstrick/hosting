import 'dart:io';

abstract class IHttpRequestFeature {
  Uri _url;
  HttpHeaders _headers;
  Stream _body;

  Uri get url => _url;

  HttpHeaders get headers => _headers;

  Stream get body => _body;
}

abstract class IHttpResponseFeature {
  int _statusCode;
  HttpHeaders _headers;
  IOSink _body;

  int get statusCode => _statusCode;

  set statusCode(code) {
    _statusCode = code;
  }

  HttpHeaders get headers => _headers;

  IOSink get body => _body;
}
