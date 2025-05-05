// server/db.js
import pg from 'pg';
const { Pool } = pg;

const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'aroma_db',
  password: '2298', 
  port: 5432,
  JWT_SECRET: 'my_super_secret_key_12345',
});

export default pool;