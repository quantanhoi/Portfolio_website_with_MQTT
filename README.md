# Introduction
This is a simple portfolio website using aws server as a host for http requests handling. This
Aws server then will send a mqtt message to the home server to get the data from postgresql database
In this case, skill, project and contact list are all loaded into the postgre database
As a result for using hiveMQ as a broker for data pulling, home server can be run anywhere on any machine without having to configuring ip address or routing
awsServer which is used to handle http requests is a simple ec2 free tier instance which can be access through public ipv4

