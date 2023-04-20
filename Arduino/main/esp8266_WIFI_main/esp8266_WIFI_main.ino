#include <Arduino_JSON.h>


/* SCUFFED DEVELOPEMENT
 *  server_2.ino
   Code Purpose: To send data from Arduino to Webpage/Webserver using the ESP8266 WIFI Module
   
   Reference Code: https://www.circuitbasics.com/how-to-set-up-a-web-server-using-arduino-and-esp8266-01/

*/
#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>
#include <NTPClient.h>
#include <WiFiUdp.h>

WiFiUDP ntpUDP;
const long utcOffsetInSeconds = -21600;
NTPClient timeClient(ntpUDP, "pool.ntp.org", utcOffsetInSeconds);
unsigned long epochTime = timeClient.getEpochTime();
struct tm *ptm = gmtime ((time_t *)&epochTime);

const char* ssid = "joes crab shack";  
const char* password = "crabbyladdy22"; 

ESP8266WebServer server(80);

String SendHTML(String TimeWeb, String DateWeb);
void handle_OnConnect();
void handle_NotFound();

String formattedTime;
String Date;
int Day;
int Month;
int Year;

void setup() {
  Serial.begin(115200);
  
  Serial.println("Connecting to ");
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
  Serial.print("IP: ");  Serial.println(WiFi.localIP());

  server.on("/", handle_OnConnect);
  server.onNotFound(handle_NotFound);
  server.begin();
  timeClient.begin();
}

void loop() {
  
  server.handleClient();
  
}

void handle_OnConnect() {

  timeClient.update();

  unsigned long epochTime = timeClient.getEpochTime();
  String formattedTime = timeClient.getFormattedTime();
 
  formattedTime = timeClient.getFormattedTime(); 
  
  server.send(200, "text/html", SendHTML(formattedTime)); 
}

void handle_NotFound(){
  server.send(404, "text/plain", "Not found");
}

String SendHTML(String TimeWeb){
  String ptr = "<!DOCTYPE html> <html>\n";
  ptr +="<head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=no\">\n";
  ptr +="<title>SCUFFED DEVELOPMENT</title>\n";

  ptr +="</head>\n";
  ptr +="<body>\n";
  ptr +="<div id=\"webpage\">\n";
  ptr +="<h1>SCUFFED DEVELOPMENT \n Arduino w/ ESP8266 ESP-01 </h1>\n";

  ptr +="<p>Current Time: ";
  ptr +=(String)TimeWeb;
  ptr +="</p>";
  
  ptr +="</div>\n";
  ptr +="</body>\n";
  ptr +="</html>\n";
  return ptr;
}
