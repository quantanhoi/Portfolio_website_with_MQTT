from flask import Flask, jsonify
import psycopg2
import paho.mqtt.client as mqtt
import json
import time
hiveMQ_server = "Insert your hiveMQ server channel here"
class MqttMessage:
    def __init__(self, sender, recipient, message, data):
        self.sender = sender
        self.recipient = recipient
        self.message = message
        self.data = data
    
    def to_json(self):
        return json.dumps(self.__dict__)
    

serverName = "homeServer"
# Connecting to the PostgreSQL database
connection = psycopg2.connect(
    host="localhost",
    port="5432",
    database="postgres",
    user="postgres",
    password="1234"
)


def get_skill():
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM skill")
        result = cursor.fetchall()
        # Get the column names
        column_names = [desc[0] for desc in cursor.description]
        # Convert each row into a dictionary where the key is the column name
        skills = [dict(zip(column_names, row)) for row in result]
        return skills



def get_project():
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM project")
        result = cursor.fetchall()
        column_names = [desc[0] for desc in cursor.description]
        projects = [dict(zip(column_names, row)) for row in result]
        return projects
    
def get_contacts():
    with connection.cursor() as cursor:
        cursor.execute("Select * from contact")
        result = cursor.fetchall()
        column_names = [desc[0] for desc in cursor.description]
        contacts = [dict(zip(column_names, row)) for row in result]
        return contacts
    


# MQTT configuration
def on_connect(client, userdata, flags, rc):
    print("Successfully connected to the HiveMQ broker")
    client.subscribe("Trung Thieu Quang Portfolio test")

def on_message(client, userdata, msg):
    #message received or sent should be in json format
    message = json.loads(msg.payload.decode())
    print("Received message:", message)
    if(message['recipient'] == serverName):
        senderName = message['sender']
        if(message['message'] == "getSkill"):
            skills = get_skill()
            new_msg = MqttMessage(serverName, senderName, "skill", skills)
            mqtt_client.publish(hiveMQ_server, new_msg.to_json())
        elif(message['message'] == "getProject"):
            projects  = get_project()
            new_msg = MqttMessage(serverName, senderName, "project", projects)
            mqtt_client.publish(hiveMQ_server, new_msg.to_json())
        elif(message['message'] == "getContact"):
            contacts = get_contacts()
            new_msg = MqttMessage(serverName, senderName, "contact", contacts)
            mqtt_client.publish(hiveMQ_server, new_msg.to_json())




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
    try:
        mqtt_client.loop_start()

        while True: 
            time.sleep(1)
            
    except KeyboardInterrupt:
        print("Program stopped by the user.")
        mqtt_client.loop_stop()