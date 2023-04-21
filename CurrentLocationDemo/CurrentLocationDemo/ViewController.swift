//
//  ViewController.swift
//  CurrentLocationDemo
//
//  Created by MAC on 29/12/22.
//
import MapKit
import UIKit
import CoreLocation

class ViewController: UIViewController , CLLocationManagerDelegate{

    @IBOutlet var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            locationManager.stopUpdatingLocation()
            
            render (location)
        }
    }
    
   func render(_ location : CLLocation){
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)

        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)

        let region = MKCoordinateRegion(center: coordinate, span: span)

        mapView.setRegion(region, animated: true)

        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
   }
}

