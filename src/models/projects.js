
import pg from "pg";

const { Pool } = pg;

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false,
  },
});

export async function getAllProjects() {
  const result = await pool.query(
    "SELECT * FROM project ORDER BY project_id"
  );

  return result.rows;
}
