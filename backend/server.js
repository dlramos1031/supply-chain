import mysql from 'mysql2';
import express from 'express';
import cors from 'cors';

const pool = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "",
  database: "scm_db",
}).promise();

const app = express();
const PORT = 5000;

app.use(cors('http://localhost:5173'));
app.use(express.json());

app.get('/', (req, res) => {
  res.send('Hello from Express!');
});

app.get('/api/product/types', async (req, res) => {
  try {
    const [result] = await pool.query("SELECT DISTINCT `type` FROM `Product`");
    res.json(result);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.get('/api/product/types/:type', async (req, res) => {
  try {
    if (req.params.type == "All") {
      const [result] = await pool.query("SELECT DISTINCT * FROM `Product`");
      res.json(result);
    } else {
      const product_type = req.params.type;
      const [result] = await pool.query("SELECT DISTINCT * FROM `Product` WHERE `type` = ?", [product_type]);
      res.json(result);
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Start the express server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});