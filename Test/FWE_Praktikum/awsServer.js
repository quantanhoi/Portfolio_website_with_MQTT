import express from 'express';
import pkg from 'pg';

const {Client} = pkg;
const app = express();
const port = 3000;

const client = new Client({
    host: 'localhost',
    port: 5432,
    database: 'postgres',
    user: 'postgres',
    password: '1234'
});

app.get('/', (req, res) => {
    res.send('Hello, world');
})

app.listen(port, () => {
    console.log(`listening on port ${port}`);
});