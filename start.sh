#!/bin/sh
cd /target
java -jar /target/dropwizard-example-1.0.0-SNAPSHOT.jar db migrate /target/example.yml &
sleep 5
java -jar /target/dropwizard-example-1.0.0-SNAPSHOT.jar server /target/example.yml
wait


