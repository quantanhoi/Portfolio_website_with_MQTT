from flask import Flask, jsonify
import paho.mqtt.client as mqtt
from flask_cors import CORS
import json
from queue import Queue

# create queues
skill_queue = Queue()
contact_queue = Queue()
project_queue = Queue()

app = Flask(__name__)
CORS(app)
hiveMQ_server = "Insert your hiveMQ server channel here"

class MqttMessage:
    def __init__(self, sender, recipient, message, data):
        self.sender = sender
        self.recipient = recipient
        self.message = message
        self.data = data
    
    def to_json(self):
        return json.dumps(self.__dict__)

serverName = "awsServer"
homeServer = "homeServer"
#https requests handling
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










#MQTT Section
def get_skill():
    msg = MqttMessage(serverName, homeServer, "getSkill", None)
    mqtt_client.publish(hiveMQ_server, msg.to_json())
    result = skill_queue.get()
    return result


def get_project():
    msg = MqttMessage(serverName, homeServer, "getProject", None)
    mqtt_client.publish(hiveMQ_server, msg.to_json())
    result = project_queue.get()
    return result



def get_contacts():
    msg = MqttMessage(serverName, homeServer, "getContact", None)
    mqtt_client.publish(hiveMQ_server, msg.to_json())
    result = contact_queue.get()
    return result





def process_message(message):
    # Your function logic goes here
    pass


# MQTT configuration
def on_connect(client, userdata, flags, rc):
    print("Successfully connected to the HiveMQ broker")
    client.subscribe(hiveMQ_server)

def on_message(client, userdata, msg):
    message = json.loads(msg.payload.decode())
    print("Received message:", message)
    if message['recipient'] == serverName:
        if message['message'] == "skill":
            skills = message['data']
            skill_queue.put(skills)
        elif message['message'] == "contact":
            contacts = message['data']
            contact_queue.put(contacts)
        elif message['message'] == "project":
            projects = message['data']
            project_queue.put(projects)


def write_response_skill(skills):
    return skills


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
    # get_skill()
    app.run(host='0.0.0.0', port=3000)
    #app.run(host='localhost', port=3000) is a blocking function, this will keep your 
    #program running until flask web server is stopped
    #then the next line to execute will be loop_stop()
    mqtt_client.loop_stop()

