//
//  Locations.swift
//  parking_app
//
//  Created by Bianka B on 5/10/23.
//

import Foundation
import MapKit

class viewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createAnnotations(locations:  annotationLocations )
    }
    let annotationLocations = [
        ["title": "Lot 55", "latitude": 32.27934884696242, "longtitude": -106.75119661660031] as [String : Any],
        ["title": "Lot 55", "latitude": 32.27817447451083, "longtitude": -106.7494417512272]
    ]
    
    func createAnnotations(locations: [[String : Any]] ) {
        for location in locations {
            let annotations = MKPointAnnotation()
            annotations.title = location["title"] as? String
            annotations.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longtitude"] as! CLLocationDegrees)
            mapView.addAnnotation(annotations)
        }
    }
    
}
