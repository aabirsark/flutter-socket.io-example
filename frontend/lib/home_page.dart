// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late io.Socket socket;

  connectToSocket() {
    socket = io.io(
        "http://localhost:8000",
        io.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build());
    socket.connect();
    socket.onConnect((data) => print("Socket Connected"));
  }

  // ? emit To server
  emitToServer(String message) {
    socket.emit("client-msg", message);
  }

  // ? listen to an server emit
  listenToSocket() {
    socket.on("server-msg", (data) => print(data));
  }

  @override
  void initState() {
    connectToSocket();

    // ? add listeners
    listenToSocket();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Socket Chat App"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              emitToServer("This message is emited by CLIENT");
            },
            child: const Text("Emit To Server")),
      ),
    );
  }
}
