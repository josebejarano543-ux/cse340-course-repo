
import pg from "pg";

const { Pool } = pg;

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false,
  },
});

export async function getAllCategories() {
  const result = await pool.query(
    "SELECT * FROM category ORDER BY category_id"
  );

  return result.rows;
}
