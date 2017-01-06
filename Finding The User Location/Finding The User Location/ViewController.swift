//
//  ViewController.swift
//  Finding The User Location
//
//  Created by Nick Natali on 12/28/2016.
//  Copyright © 2016 Make It Appen. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var courseLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    @IBOutlet var altitudeLabel: UILabel!
    
    var locationManager = CLLocationManager()
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
        let location = locations[0]
        
        self.latitudeLabel.text = "Latitude: " + String(location.coordinate.latitude)
        
        self.longitudeLabel.text = "Longitude: " +  String(location.coordinate.longitude)
        
        self.courseLabel.text = "Course: " + String(location.course)
        
        self.speedLabel.text = "Speed: " +  String(location.speed)
        
        self.altitudeLabel.text = "Altitude: " + String(location.altitude)
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            
            if error != nil {
                print(error)
            } else {
                
                if let placemark = placemarks?[0]  {
                    var address = ""
                    
                    if placemark.subThoroughfare != nil {
                        address += placemark.subThoroughfare! + " "
                    }
                    
                    if placemark.thoroughfare != nil {
                        address += placemark.thoroughfare! + " "
                    }
                    
                    if placemark.subLocality != nil {
                        address += placemark.subLocality! + " "
                    }
                    
                    if placemark.administrativeArea != nil {
                        address += placemark.administrativeArea! + "\n"
                    }
                    
                    if placemark.postalCode != nil {
                        address += placemark.postalCode! + " "
                    }
                    
                    if placemark.country != nil {
                        address += placemark.country! + " "
                    }
                    
                    self.addressLabel.text = address
                    
                }
                
                
                
                
            }
            
            
            
        }
        
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    
}

