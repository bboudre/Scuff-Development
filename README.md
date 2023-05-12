# Scuff Development
Team repo for CS 371 Project

Application "Aggie Park" that helps you find parking with GPS tracking based on your preferred campus building destination. 

## Link to Project Site
[Project Site](https://bboudre.github.io/SC-Project-Site/)

## Link to App Repo (Explains Folder Structure of App's Code)
[Parking App](https://github.com/pjojola/Parking_App_CS)

## **Current Project Status** [May 2023]
Due to the time given for the project, the Arduino, web server, and application run independently of each other. 

### Working Functionality 
    Aggie Park
* The application can show the user's location, have the user input a destination, and map a route from location to destination. 
* The campus map is connected to the app of NMSU. 
* Settings is set to change user's permit type. 

    Arduino and Web Server 
* Sensor reads data correctly and sends it to server seperate from app 

### Future Work 
    Aggie Park 
* Switch from a local search on MapKit to a custom annotation search. 
    * database for campus buildings' closest parking lots based on permit type
* Map parking lot annotations and reroute polyline to chosen parking lot 
* Update real-time for duration to get from user location to destination 
* Send notifications to user if closer parking is found if desired 

    __Arduino, WIFI module, and sensor are not compatible with each other for the goals of this project__
* If troubleshooting works connect Arduino and web server to communicate with app 
* Else research for more efficient mechanism to detecting open/free parking spots


Much work/research and time are required for further development of the app. 

We will continue to work on this app outside of the initial time given, to hopefully succeed in all functional components working. 






