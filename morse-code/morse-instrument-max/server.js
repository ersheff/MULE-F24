
import express, { json } from 'express';
import http from 'http';
import { WebSocketServer, WebSocket } from 'ws';

const app = express();
const server = http.createServer(app);
const wss = new WebSocketServer({ server });

app.use(express.static('public'));
app.use('/src', express.static('src'));
app.use('/node_modules', express.static('node_modules'));
app.use("/", express.static("./node_modules/bootstrap/dist/"));

app.get('/', (req, res) => {
  res.sendFile('./public/index.html');
});

wss.on('connection', (ws, req) => {
  const reqUrl = new URL(req.url, `http://${req.headers.host}`);
  const role = reqUrl.searchParams.get("role");

  if (role === "visuals") {
    ws.role = "visuals";
  } else if (role === "player") {
    ws.role = "player";
  } else {
    console.log('closing socket for:', role)
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

  console.log('A user connected');

  ws.on('close', () => {
    console.log('A user disconnected');
  });
});

const PORT = 8000;

server.listen(PORT, function () {
  console.log(`Server running on port ${PORT}`);
});
