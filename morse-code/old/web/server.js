import express from "express";
import { createServer } from "node:http";
import { WebSocketServer } from "ws";
import { URL } from "url";

const app = express();
const server = createServer(app);
const wss = new WebSocketServer({ server });

app.use(express.static("./"));
const port = process.env.PORT || 3000;

wss.on("connection", (ws, req) => {
  console.log("New WebSocket connection");

  const reqUrl = new URL(req.url, `http://${req.headers.host}`);
  const role = reqUrl.searchParams.get("role");

  if (role === "visuals") {
    ws.role = "visuals";
  } else if (role === "player") {
    ws.role = "player";
  } else {
    ws.close();
  }

  ws.on("message", (message) => {
    const data = JSON.parse(message);

    // If the message is from a player, send it to the visuals connection
    if (ws.role === "player") {
      wss.clients.forEach((client) => {
        if (client.readyState === ws.OPEN && client.role === "visuals") {
          client.send(JSON.stringify(data));
        }
      });
    }
  });

  ws.on("close", () => {
    console.log("WebSocket connection closed");
  });
});

server.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});

// Clock
setInterval(() => {
  const clockMessage = JSON.stringify({ type: "clock" });

  wss.clients.forEach((client) => {
    if (client.readyState === WebSocket.OPEN && client.role === "player") {
      client.send(clockMessage);
    }
  });
}, 200);
