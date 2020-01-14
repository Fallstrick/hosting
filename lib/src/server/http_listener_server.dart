import 'dart:io' as io;

import 'package:fallstrick_hosting/src/context/feature.dart';
import 'package:fallstrick_hosting/src/context/feature_collection.dart';
import 'package:fallstrick_hosting/src/context/http_context.dart';
import 'package:fallstrick_hosting/src/server/http_listener_feature.dart';
import 'package:fallstrick_hosting/src/server/i_server.dart';

class HttpListenerServer implements IServer {
  String _address;
  int _port;

  HttpListenerServer(address, port) {
    _address = address;
    _port = port;
  }

  @override
  Future runAsync(handler) async {
    var _httpServer = await io.HttpServer.bind(_address, _port);
    print('[Info]: Server started and is listening on:$_address:$_port');
    _httpServer.listen((request) async {
      await _handleRequest(request, handler);
    });
  }

  Future _handleRequest(io.HttpRequest request, handler) async {
    var _requestFeature = HttpRequestFeature(request);
    var _responseFeature = HttpResponseFeature(request.response);
    var features = FeatureCollection();
    features.set<IHttpRequestFeature>(_requestFeature);
    features.set<IHttpResponseFeature>(_responseFeature);
    var httpContext = HttpContext(features);
    await handler(httpContext);
    await request.response.close();
  }
}
