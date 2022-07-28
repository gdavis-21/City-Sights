//
//  ContentModel.swift
//  City-Sights
//
//  Created by Grant Davis on 7/20/22.
//

import Foundation
import CoreLocation

class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    var locationManager = CLLocationManager()
    
    override init() {
        
        // Initilize NSObject
        super.init()
        
        // Set ContentModel as delegate of locationManager
        locationManager.delegate = self
        
        // Request permission from user
        locationManager.requestWhenInUseAuthorization()
        
        // TODO: Geolocate user (Detect if user granted permission)
    }
    
    // MARK: locationManager Delegate Functions
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if locationManager.authorizationStatus ==  .authorizedAlways ||
            locationManager.authorizationStatus == .authorizedWhenInUse {
            // Permission granted
            locationManager.startUpdatingLocation()
            
        }
        else if locationManager.authorizationStatus == .denied {
            // Permission denied
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Get location of user
        print(locations.first ?? "no locations")
        let userLocation = locations.first
        
        if userLocation != nil {
            
            // Stop requesting location
            locationManager.stopUpdatingLocation()
            
            // Send coordinates of user to Yelp API
            //getBusinesses(category: "arts", location: userLocation!)
            getBusinesses(category: "restaurants", location: userLocation!)
        }
    }
    
    // MARK: Yelp API Methods
    
    func getBusinesses(category: String, location: CLLocation) {
        
        // Create URL
//        let urlString = "https://api.yelp.com/v3/businesses/search?latitude=\(location.coordinate.latitude)&longitude=\(location.coordinate.longitude)&categories=\(category)&limit=6"
        
        var urlComponents = URLComponents(string: "https://api.yelp.com/v3/businesses/search")
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: String(category)),
            URLQueryItem(name: "limit", value: "6")
        ]
        
        if let url = urlComponents?.url {
            
            // Create URLRequest
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            
            // Customize request with authorization code
            request.httpMethod = "GET"
            request.addValue("Bearer API KEY", forHTTPHeaderField: "Authorization")
            
            // Get URLSession
            let session = URLSession.shared
            
            // Create DataTask
            let dataTask = session.dataTask(with: request) { data, response, error in
                
                // Check there isn't an error
                guard error == nil else {
                    print(response)
                    return
                }
                
                
            }
            
            // Start DataTask
            dataTask.resume()
        }
    }
    
}
