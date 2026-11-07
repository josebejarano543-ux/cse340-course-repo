
import pg from "pg";

const { Pool } = pg;


const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false,
  },
});


export async function getAllOrganizations() {
  const result = await pool.query(
    "SELECT * FROM organization ORDER BY organization_id"
  );

  return result.rows;
}
