const express = require('express')
const app = express()
const PORT = process.env.PORT_BACKEND || 4000;
const db = require('./db')
const cors = require("cors");

app.use(cors());

app.get('/', (req, res) => {
  res.send('Hello World10!')
})

app.get('/users/list', async (req, res) => {
  try {
    console.log('Fetching users from the database');
    var sql = 'SELECT * FROM users';
    const [result] = await db.query(sql)
    res.send(result);
  } catch (error) {
    console.error('Error fetching users:', error);
    res.status(500).send('Error fetching users');
  }
})

app.get('/health-check', async (req, res) => {
  try {
    await db.query('SELECT 1');
    res.status(200).send('OK');
  } catch (error) {
    console.error('Health check failed:', error);
    res.status(500).send('DB Connection Failed');
  }
});

app.listen(PORT, () => {
  console.log(`Example app listening on port ${PORT}`)
})