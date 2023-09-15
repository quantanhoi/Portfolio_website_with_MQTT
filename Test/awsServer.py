from flask import Flask, jsonify
import paho.mqtt.client as mqtt
from flask_cors import CORS
import json
app = Flask(__name__)
CORS(app)


class MqttMessage:
    def __init__(self, sender, recipient, message):
        self.sender = sender
        self.recipient = recipient
        self.message = message
    
    def to_json(self):
        return json.dumps(self.__dict__)

def get_skill():
    msg = MqttMessage("awsServer", "homeServer", "getSkill")
    mqtt_client.publish("Trung Thieu Quang Portfolio test", msg.to_json())

def get_project():
    msg = MqttMessage("awsServer", "homeServer", "getProject")
    mqtt_client.publish("Trung Thieu Quang Portfolio test", msg.to_json())

def get_contacts():
    msg = MqttMessage("awsServer", "homeServer", "getContacts")
    mqtt_client.publish("Trung Thieu Quang Portfolio test", msg.to_json())

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
