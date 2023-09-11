import pkg from 'pg';
import express from 'express';
import cors from 'cors';
import mqtt from 'mqtt';

const {Client} = pkg;

class mqttMessage {
    constructor(sender, recipient, message) {
        this.sender = sender;
        this.recipient = recipient;
        this.message = message;
    }
}


//import the entire pg module as a single object, and then extract the Client class from that object.

const app = express();

const port = 3000;
const client = new Client({
    host: 'localhost',
    port: 5432,
    database: 'postgres',
    user: 'postgres',
    password: '1234'
});

await client.connect();
async function getSkill() {
    
    const result = await client.query('SELECT * from skill');
    // console.log(result.rows);
    // console.log(result.rows.length);
    // for(var i = 0; i < result.rows.length; i++) {
    //     console.log(result.rows[i].name);
    // }
    return result.rows;
}
async function getProject() {
    const result = await client.query('SELECT * from project');
    console.log(result.rows);
    return result.rows;

}

let testResult;
//because javascript is asynchronous so getSkill.then will likely get executed after 
//console.log(testResult) and this is where the variable has not been set, therefore it is undefined
// getSkill().then(result => testResult   = result);
// console.log(testResult);

app.use(cors());
app.get('/skill', async (req, res) => {
    const skills = await getSkill();
    console.log(skills);
    res.json(skills);
});

app.get('/project', async (req, res) => {
    const projects = await getProject();
    console.log(projects);
    res.json(projects);
});

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}/`);
});

const mqttClient = mqtt.connect('mqtt://broker.hivemq.com');

mqttClient.on('connect', function () {
    console.log('Successfully connected to the HiveMQ broker');
    // Add additional code here
});

mqttClient.on('error', function (error) {
    console.log('Error connecting to the HiveMQ broker:', error);
    // Handle error
});


mqttClient.subscribe('Trung Thieu Quang Portfolio test', function (error) {
    if (!error) {
        console.log('Successfully subscribed to the topic');
    } else {
        console.log('Error subscribing to the topic:', error);
    }
});

mqttClient.on('message', function (topic, message) {
    console.log('Received message:', message.toString());
    // Handle incoming message
});