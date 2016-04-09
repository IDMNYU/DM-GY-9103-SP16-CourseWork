//
//  MapViewController..swift
//  WorldTrotter
//
//  Created by Yuchi on 16/2/16.
//  Copyright © 2016 Yuchi. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    var mapView: MKMapView!

    @IBOutlet weak var map: MKMapView!
    
    override func loadView() {
        
        //create a map view
        mapView = MKMapView()
        
        //set it as "the" view of this view controller
        view = mapView
    
//        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        let segmentedControl =  UISegmentedControl (items: [standardString, satelliteString, hybridString])
        
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: "mapTypeChanged:", forControlEvents: .ValueChanged)
        
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
//        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(view.topAnchor)
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
//        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor)
//        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor)

        let margins = view.layoutMarginsGuide
        
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
        
    }
    
    func mapTypeChanged(segControl: UISegmentedControl){
        switch segControl.selectedSegmentIndex{
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 2:
            mapView.mapType = .Satellite
        default:
            break
        }
    }
   

    override func viewDidLoad(){
        //always call the super implementation of viewDidLoad
        super.viewDidLoad()
        print("MapviewController loaded its view")
        var locationManager: CLLocationManager!
        
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            
            func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
                let location = locations.last as! CLLocation
                
                let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
                
                self.map.setRegion(region, animated: true)
            }
        }
        

        
    }
    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        print("viewWillAppear Sucess")
//    }
//
    
    
}

