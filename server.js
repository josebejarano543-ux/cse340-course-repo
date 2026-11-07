import "dotenv/config";
import { getAllOrganizations } from "./src/models/organizations.js";
import { getAllProjects } from "./src/models/projects.js";
import express from "express";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { getAllCategories } from "./src/models/categories.js";

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

app.get("/organizations", async (req, res) => {
  try {
    const organizations = await getAllOrganizations();

    res.render("organizations", {
      title: "Organizations",
      organizations: organizations,
    });
  } catch (error) {
    console.error("Error loading organizations:", error);
    res.status(500).send("Error loading organizations");
  }
});


// Service projects page

app.get("/projects", async (req, res) => {
  try {
    const projects = await getAllProjects();

    res.render("projects", {
      title: "Service Projects",
      projects: projects,
    });
  } catch (error) {
    console.error("Error loading projects:", error);
    res.status(500).send("Error loading projects");
  }
});


// Categories page
app.get("/categories", async (req, res) => {
  try {
    const categories = await getAllCategories();
    res.render("categories", {
      title: "Categories",
      categories
    });
  } catch (error) {
    console.error(error);
    res.status(500).send("Error loading categories");
  }
});

// Start the server
app.listen(port, () => {
  console.log(`Service Network running at http://localhost:${port}`);
});
