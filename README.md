# Scuff Development
Team repo for CS 371 Project

Application "Aggie Park" that helps you find parking with GPS tracking based on your preferred campus building destination. 

**Team Members**
Patrick Jojola, Bianka Boudreaux, Rey Aguirre

## Links
- [Project Site](https://bboudre.github.io/SC-Project-Site/)
- [App Repo (Explains Folder Structure of Aggie Park)](https://github.com/pjojola/Parking_App_CS)

## ★Current Project Status★ [May 2023]
Due to the time given for the project, the Arduino, web server, and application run independently of each other. 

### Working Functionality 
* The application can show the user's location, have the user input a destination, and map a route from location to destination. 
* The campus map is connected to the app of NMSU. 
* Settings is set to change user's permit type. 
* Sensor reads data correctly and sends it to server seperate from app 

### Future Work 
* Switch from a local search on MapKit to a custom annotation search. 
    * database for campus buildings' closest parking lots based on permit type
* Map parking lot annotations and reroute polyline to chosen parking lot 
* Update real-time for duration to get from user location to destination 
* Send notifications to user if closer parking is found if desired 

**Arduino, WIFI module, and sensor are not compatible with each other for the goals of this project**
* If troubleshooting works connect Arduino and web server to communicate with app 
* Otherwise research for a more efficient mechanism to detecting open/free parking spots
* If we had the capital, we could have researched into making their own microcontroller design / or also go the route of Raspberry pi


### Developers' Note
Much work/research and time are required for further development of the app. We will continue to work on this app outside of the initial time given, to hopefully succeed in all functional components working. 

## How to Run [May 2023]
### Aggie Park App 
* Download Xcode (Disk space needed is a whopping 8GB)
* Build the file and run in simulator 

### Web Server 
Run in VScode

### Arduino/Ultrasonic Sensor w/ ESP 8266 ESP-01 WIFI Module
* Using kit from CS 273
* Code and setup is in the "Arduino" folder 
* Run on Arduino






