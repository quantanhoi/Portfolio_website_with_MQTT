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


# when we simply use cursor.execute here, python doesn't automatically fetch the sql database with json format, therefore no columns name
# that's why we need to use cursor.descriptions here
# def get_skill():
#     with connection.cursor() as cursor:
#         cursor.execute("SELECT * FROM skill")
#         result = cursor.fetchall()
#         return result
def get_skill():
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM skill")
        result = cursor.fetchall()
        # Get the column names
        column_names = [desc[0] for desc in cursor.description]
        # Convert each row into a dictionary where the key is the column name
        skills = [dict(zip(column_names, row)) for row in result]
        return skills

# def get_project():
#     with connection.cursor() as cursor:
#         cursor.execute("SELECT * FROM project")
#         result = cursor.fetchall()
#         return result
def get_project():
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM project")
        result = cursor.fetchall()
        # Get the column names
        column_names = [desc[0] for desc in cursor.description]
        # Convert each row into a dictionary where the key is the column name
        projects = [dict(zip(column_names, row)) for row in result]
        return projects
    
def get_contacts():
    with connection.cursor() as cursor:
        cursor.execute("Select * from contact")
        result = cursor.fetchall()
        column_names = [desc[0] for desc in cursor.description]
        contacts = [dict(zip(column_names, row)) for row in result]
        return contacts

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

@app.route('/contact')
def contact_endpoint():
    contacts = get_contacts()
    print(contacts)
    return jsonify(contacts)

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
