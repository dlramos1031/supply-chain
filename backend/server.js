import mysql from 'mysql2';
import express from 'express';
import cors from 'cors';

const pool = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "",
  database: "system_db_2",
}).promise();

const app = express();
const PORT = 5000;

app.use(cors('http://localhost:5173'));
app.use(express.json());

app.get('/', (req, res) => {
  res.send('Hello from Express!');
});

app.get('/api/products', async (req, res) => {
  try {
    const [result] = await pool.query("SELECT * FROM `scm_product`");
    res.json(result);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.get('/api/customers', async (req, res) => {
  try {
    const [result] = await pool.query("SELECT * FROM `scm_customer`");
    res.json(result);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.get('/api/orders', async (req, res) => {
  try {
    const [result] = await pool.query("SELECT o.`scm_order_ID`, c.`customer_name`, o.`order_date`, o.`quantity_ordered` FROM `scm_order` o JOIN `scm_customer` c ON o.`scm_customer_ID` = c.`scm_customer_ID`");
    res.json(result);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Start the express server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});