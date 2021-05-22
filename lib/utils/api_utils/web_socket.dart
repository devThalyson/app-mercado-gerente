import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocket {
  WebSocketChannel channel =
      IOWebSocketChannel.connect("ws://ip-local-host:8080/socket");

  close() {
    channel.sink.close();
  }
}
