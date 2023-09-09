from flask import Flask, jsonify
import psycopg2
import paho.mqtt.client as mqtt
import os
from flask_cors import CORS

app = Flask(__name__)
CORS(app)


class MqttMessage:
    def __init__(self, sender, recipient, message):
        self.sender = sender
        self.recipient = recipient
        self.message = message

# Connecting to the PostgreSQL database
connection = psycopg2.connect(
    host="localhost",
    port="5432",
    database="postgres",
    user="postgres",
    password="1234"
)

def get_skill():
    with connection:
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM skill")
            result = cursor.fetchall()
            return result

def get_project():
    with connection:
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM project")
            result = cursor.fetchall()
            return result

@app.route('/skill')
def skill_endpoint():
    skills = get_skill()
    print(skills)
    return jsonify(skills)

@app.route('/project')
def project_endpoint():
    projects = get_project()
    print(projects)
    return jsonify(projects)

# MQTT configuration
def on_connect(client, userdata, flags, rc):
    print("Successfully connected to the HiveMQ broker")
    client.subscribe("Trung Thieu Quang Portfolio test")

def on_message(client, userdata, msg):
    print("Received message:", msg.payload.decode())

def on_subscribe(client, userdata, mid, granted_qos):
    print("Successfully subscribed to the topic")

def on_disconnect(client, userdata, rc):
    print("Successfully disconnected from the broker")

mqtt_client = mqtt.Client()
mqtt_client.on_connect = on_connect
mqtt_client.on_message = on_message
mqtt_client.on_subscribe = on_subscribe
mqtt_client.on_disconnect = on_disconnect
mqtt_client.connect('broker.hivemq.com', 1883, 60)

if __name__ == '__main__':
    mqtt_client.loop_start()
    app.run(host='localhost', port=3000)
    mqtt_client.loop_stop()
