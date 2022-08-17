//
//  BusinessMap.swift
//  City-Sights
//
//  Created by Grant Davis on 8/17/22.
//

import SwiftUI
import MapKit

struct BusinessMap: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    
    var locations: [MKPointAnnotation] {
        
        var annotations = [MKPointAnnotation]()
        
        for business in model.restaurants + model.sights {
            
            // Create a new annotation &&
            
            // Check if business has a latitute and a longitute
            
            if business.coordinates?.latitude != nil && business.coordinates?.longitude != nil {
                var a = MKPointAnnotation()
                a.coordinate = CLLocationCoordinate2D(latitude: business.coordinates!.latitude!, longitude: business.coordinates!.longitude!)
                a.title = business.name ?? ""
                
                annotations.append(a)
            }
        }
        
        return annotations
    }
    
    // Creates UIKit view
    func makeUIView(context: Context) -> MKMapView {
        
        // Make UIKit view
        let mapView = MKMapView()
        
        // Update mapView
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        
        return mapView
    }
    
    // Updates UIKit view (change properties, call methods)
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        // Remove previous annotations
        uiView.removeAnnotations(uiView.annotations)
        
        // Add annotations for business
        uiView.showAnnotations(locations, animated: true)
    }
    
    // Cleans up UIKit view, when view not needed
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        
    }
}
