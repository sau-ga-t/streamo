import 'dart:io';

import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart' as shelf_router;
import 'package:shelf/shelf.dart';

void main(List<String> args) async {
  final cascade = Cascade().add(_router);
  var server = await shelf_io.serve(
      logRequests().addHandler(cascade.handler), InternetAddress.anyIPv4, 8080);
  print('Serving at http://${server.address.host}:${server.port}');
}

//Router for shelf
final _router = shelf_router.Router()
  ..get('/helloworld', _helloWorldHandler)
  ..get('/', _homeHandler);

//Predefined routers
Response _helloWorldHandler(Request request) => Response.ok('Hello, World!');
Response _homeHandler(Request request) => Response.ok("Homepage");
