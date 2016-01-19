java -jar target/dropwizard-example-1.0.0-SNAPSHOT.jar db migrate example.yml &
sleep 5
java -jar target/dropwizard-example-1.0.0-SNAPSHOT.jar server example.yml  
wait


