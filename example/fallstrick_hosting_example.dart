import 'package:fallstrick_hosting/fallstrick_hosting.dart';

void main() {
  createWebHostBuilder('localhost', 8080).build().run();
}

WebHostBuilder createWebHostBuilder(String address, int port) {
  return WebHostBuilder().useHttpListener(address, port).configure((app) {
    app.use(fooMiddleware);
    app.use(headerMiddleware);
  });
}
//
RequestDelegate fooMiddleware(RequestDelegate next) {
  return (context) {
    context.response.writeAsync('Foo==>');
    next(context);
  };
}

RequestDelegate headerMiddleware(RequestDelegate next) {
  return (context) {
    context.response.writeAsync('header==>');
    next(context);
  };
}
