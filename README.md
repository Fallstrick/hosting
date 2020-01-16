# fallstrick_hosting

![language](https://woolson.gitee.io/npmer-badge/ilcr-none-none-dart-ffffff-555555-%3E=2.7.0%20%3C3.0.0-ffffff-007ec6-r-t-t.svg)
![license](https://img.shields.io/github/license/Fallstrick/hosting)




## Usage

A simple usage example:

```dart
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

```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/Fallstrick/hosting/issues
