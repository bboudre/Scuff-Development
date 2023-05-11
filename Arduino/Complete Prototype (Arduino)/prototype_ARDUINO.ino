#include <Arduino_JSON.h>


/* SCUFFED DEVELOPEMENT - v0.4
 *  prototype_ARDUINO.ino
   Code Purpose: To visualize the code of a completed system (if parts were compatible w/ one another)
   
   Reference Code: https://www.circuitbasics.com/how-to-set-up-a-web-server-using-arduino-and-esp8266-01/

*/
#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>
#include <NTPClient.h>
#include <WiFiUdp.h>

WiFiUDP ntpUDP;

// Stores WIFI name and password
const char* ssid = "";  
const char* password = ""; 

// Initiates pins on Arduino to read trig and echo data
const int trig_pin = 9;
const int echo_pin = 10;

// Variables for duration and distance
long duration, distance;
int parking_count = 0;

// If the distance is less than a specific parameter in cm, car passed by
void detect_car_in(long distance) {
   if (distance < 45)
       parking_count = parking_count + 1;
}

void detect_car_out(long distance) {
   if (distance < 45)
       parking_count = parking_count - 1;
}

// Web server
ESP8266WebServer server(80);

String SendHTML(String TimeWeb, String DateWeb);
void handle_OnConnect();
void handle_NotFound();

void setup() {
  Serial.begin(115200);
  
  Serial.println("Connecting to: ");
  Serial.println(ssid);

  WiFi.begin(ssid, password);

  // Stays in loop until WIFI is connected
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.print(".");
  } 

  // Prints IP address of web page to go to
  Serial.println("");
  Serial.println("Connected to WiFi");
  Serial.print("IP Address: ");  
  Serial.println(WiFi.localIP());

  server.on("/", handle_OnConnect);
  server.onNotFound(handle_NotFound);
  server.begin();

  // Sets up pins to take input and produce output
  pinMode(trig_pin, OUTPUT); 
  pinMode(echo_pin, INPUT);
  Serial.begin(9600);
}

void loop() {
  
  server.handleClient();
  
  // Reads pins
  digitalWrite(trig_pin, LOW);
  delayMicroseconds(2);
  digitalWrite(trig_pin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trig_pin, LOW);

  // How long echo takes to echo off object and return to sensor
  duration = pulseIn(echo_pin, HIGH);

  // Distance = speed * time
  // The distance from an object is half the total distance
  distance = duration * 0.034 / 2;

  Serial.print("Distance (cm):");
  Serial.println(distance);

  // Sensor 1 - Detects cars going in - count++
  detect_car_in(distance);

  // Sensor 2 - Detects cars leaving - count--
  // detect_car_out(distance);

  
  Serial.print("Parking Lot (Number of cars): ");
  Serial.println(parking_count);
  
  // Delays are for simulation purposes
  delay(1000);
}

void handle_OnConnect() {
  server.send(200, "text/html", SendHTML(parking_count)); 
}

void handle_NotFound(){
  server.send(404, "text/plain", "Not found");
}

String SendHTML(int count){
  String ptr = "<!DOCTYPE html> <html>\n";
  ptr +="<head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=no\">\n";
  ptr +="<title>SCUFFED DEVELOPMENT</title>\n";

  ptr +="</head>\n";
  ptr +="<body>\n";
  ptr +="<div id=\"webpage\">\n";
  ptr +="<h1>SCUFFED DEVELOPMENT - Prototype</h1>\n";

  // Prints the count of cars in a given parking lot
  ptr +="<p>Science Hall Parking Lot (Number of Cars): ";
  ptr +=(String)count;
  ptr +="</p>";
  
  ptr +="</div>\n";
  ptr +="</body>\n";
  ptr +="</html>\n";
  return ptr;
}