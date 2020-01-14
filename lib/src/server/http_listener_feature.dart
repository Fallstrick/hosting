import 'package:fallstrick_hosting/src/context/feature.dart';
import 'dart:io' as io;

class HttpRequestFeature implements IHttpRequestFeature {
  io.HttpRequest _context;

  HttpRequestFeature(io.HttpRequest context) {
    _context = context;
  }

  @override
  Stream get body => _context;

  @override
  io.HttpHeaders get headers => _context.headers;

  @override
  Uri get url => _context.uri;
}

class HttpResponseFeature implements IHttpResponseFeature {
  io.HttpResponse _context;

  HttpResponseFeature(io.HttpResponse context) {
    _context = context;
  }


  @override
  io.IOSink get body => _context;

  @override
  io.HttpHeaders get headers => _context.headers;

  @override
  int get statusCode => _context.statusCode ;

  @override
  set statusCode(code) {
    _context.statusCode  = code;
  }

}
