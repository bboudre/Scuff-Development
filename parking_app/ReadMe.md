# Quick Notes

## Folder Organization 

### Scrap 
The folder contains code that needs further research on how to implement. Code was the first rendition of the "Find Parking" feature.  The function would have a custom annotations database for campus buildings and show the top 3 closet parking lots (ordering from the user's permit type, availability, and distance)  

### Maps
In charge of creating the logic of inserting user location and adding a route to the destination on the map. 

### LocationSearch 
Used to allow user to input their desired destination and setup up how destinations are viewed. Where Apple Maps API do callbacks 

### Views 
Folder that structures the intial menu of the app 

### Managers 
Used to manage LocationSearch 


## Resources Used 

- https://www.youtube.com/watch?v=cEkWTQNIEXA&ab_channel=tundsdev
Add a Search Bar In SwiftUI with Searchable (SwiftUI Search bar, SwiftUI Searchable)

- https://www.youtube.com/watch?v=ol1cmZ-TeXY&ab_channel=codedamn
JSON data from server to swift 

- https://www.youtube.com/watch?v=AStGiBv832g&ab_channel=datasith
Connection Wifi moddule to Swift 

- https://stackoverflow.com/questions/40620002/map-annotations-search
Searching custom annotations in mapView 
 
- https://www.youtube.com/watch?v=vfWxwDfX30I&ab_channel=azamsharp
Adding annotation to map


## Function Notes for Developer

### App 
- Creates and enviroment object that is used on mutiple instances 
- This benefits because it needs to use the same instance 

### LocationSearchView 
- Selects the location and stores it into LocationSearchViewModel

### LocationSearchViewModel
- Is used to store the selected destination location

### MapView
- Contains LocationSearchViewModel 
- UpdateUIView is called here where access to the desired destinaton is saved

