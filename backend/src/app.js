// ? Imports
const express = require("express");
const app = express();
const http = require("http");
const socketIO = require("socket.io");

// ? create server
const server = http.createServer(app);
const io = socketIO(server);

// ? PORT
const port = process.env.PORT || 8000;

// ? Start listening the server
server.listen(port, () => {
  console.log(`Server started at ${port} `);
});

// ? Add Socket listeners
io.on("connection", (socket) => {
  console.log("A user joined");

  // ? Listen to an event
  socket.on("client-msg", (data) => {
    console.log(data);

    // ? emit an event to client
    socket.emit("server-msg", "This Message is sent by Server");
  });
});
