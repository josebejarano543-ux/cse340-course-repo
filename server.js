
import express from "express";
import path from "node:path";
import { fileURLToPath } from "node:url";
import "dotenv/config";

const app = express();
const port = process.env.PORT || 3000;

const filename = fileURLToPath(import.meta.url);
const dirname = path.dirname(filename);

// Configure EJS
app.set("view engine", "ejs");
app.set("views", path.join(dirname, "src", "views"));

// Serve static files
app.use(express.static(path.join(dirname, "public")));

// Home page
app.get("/", (req, res) => {
  res.render("home", { title: "Home" });
});

// Organizations page
app.get("/organizations", (req, res) => {
  res.render("organizations", { title: "Organizations" });
});

// Service projects page
app.get("/projects", (req, res) => {
  res.render("projects", { title: "Service Projects" });
});

// Categories page
app.get("/categories", (req, res) => {
  res.render("categories", { title: "Categories" });
});

// Start the server
app.listen(port, () => {
  console.log(`Service Network running at http://localhost:${port}`);
});
