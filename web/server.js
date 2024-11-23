import express from "express";
import { createServer } from "node:http";
import path from "path";
import { fileURLToPath } from "url";

// Get the directory name of the current module file
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const server = createServer(app);

// Resolve the path to the parent folder (MULE-F24)
const parentFolderPath = path.resolve(__dirname, "..");
app.use(express.static(parentFolderPath));
const port = process.env.PORT || 3000;

server.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
