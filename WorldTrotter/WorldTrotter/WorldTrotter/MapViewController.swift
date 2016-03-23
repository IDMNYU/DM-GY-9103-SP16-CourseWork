//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Keval Shah on 2/15/16.
//  Copyright © 2016 Keval Shah. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UIApplicationDelegate, MKMapViewDelegate
{
    var mapView: MKMapView!
    let loc = CLLocationManager()
    let findButton = UIButton()
    var locPins = [MKPointAnnotation]()
    var noPins = 0
    
    override func loadView() {
        mapView = MKMapView()
        
        view = mapView
        
        loc.requestAlwaysAuthorization()
        
        let segmentedControl = UISegmentedControl(items: ["Standard","Hybrid","Satellite"])
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: "mapTypeChanged:", forControlEvents: .ValueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        //let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(view.topAnchor)
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor,constant: 8)
        //let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor)
        //let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor)
        
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)

        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
        
        
        findButton.setTitle("Find Location", forState: .Normal)
        findButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        findButton.titleLabel!.text = "Find Location"
        view.addSubview(findButton)
        let xCenterConstraint = NSLayoutConstraint(item: view, attribute: .CenterX, relatedBy: .Equal, toItem: findButton, attribute: .CenterX, multiplier: 1, constant: 0)
        view.addConstraint(xCenterConstraint)
        findButton.translatesAutoresizingMaskIntoConstraints = false
        findButton.addTarget(self, action: "findUser:", forControlEvents: .TouchUpInside)
        let findButtonConstraint = findButton.bottomAnchor.constraintEqualToAnchor(bottomLayoutGuide.topAnchor, constant: -30)
        
        findButtonConstraint.active = true
        
        let cyclePinsButton = UIButton()
        cyclePinsButton.setTitle("Cycle Pins", forState: .Normal)
        cyclePinsButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        cyclePinsButton.titleLabel!.text = "  Cycle Location Pins  "
        view.addSubview(cyclePinsButton)
        let x2CenterConstraint = NSLayoutConstraint(item: view, attribute: .CenterX, relatedBy: .Equal, toItem: cyclePinsButton, attribute: .CenterX, multiplier: 1, constant: 0)
        view.addConstraint(x2CenterConstraint)
        cyclePinsButton.translatesAutoresizingMaskIntoConstraints = false
        cyclePinsButton.addTarget(self, action: "cycleLocationPins:", forControlEvents: .TouchUpInside)
        let cycleButtonbottomConstraint = cyclePinsButton.bottomAnchor.constraintEqualToAnchor(bottomLayoutGuide.topAnchor, constant: -70)
        
        cycleButtonbottomConstraint.active = true
        
        let birthPin = MKPointAnnotation()
        birthPin.coordinate = CLLocationCoordinate2DMake(19.021237, 72.858686)
        birthPin.title = "Mumbai"
        let homePin = MKPointAnnotation()
        homePin.coordinate = CLLocationCoordinate2DMake(40.636342, -74.025084)
        homePin.title = "New York"
        let locatePin = MKPointAnnotation()
        locatePin.coordinate = CLLocationCoordinate2DMake(43.684307,7.235599)
        locatePin.title = "Nice Promenade"
        locPins = [birthPin,homePin,locatePin]
        for p in locPins
        {
            mapView.addAnnotation(p)
        }

    }
    
    func mapTypeChanged(segControl: UISegmentedControl)
    {
        switch segControl.selectedSegmentIndex
        {
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view")
    }
    
    @IBAction func cycleLocationPins(sender: UIButton) {
        print("Cycle through Location Pins")
        let pinPoint = MKMapPointForCoordinate(mapView.annotations[noPins].coordinate)
        let pinPointLoc = MKMapRectMake(pinPoint.x , pinPoint.y, 0.1, 0.1)
        mapView.setVisibleMapRect(pinPointLoc, animated: true)
        noPins += 1
        if noPins >= 3
        {
            noPins = 0
        }
    }
    
    @IBAction func findUser(stepper: UIButton) {
        
        loc.requestWhenInUseAuthorization()
        
        mapView.setUserTrackingMode(.FollowWithHeading,
            animated: true)
        mapView.showsUserLocation = true
        
        print("User Location Check")
    }
}