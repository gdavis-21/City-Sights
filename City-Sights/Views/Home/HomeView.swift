//
//  HomeView.swift
//  City-Sights
//
//  Created by Grant Davis on 8/3/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    @State var isMapShowing = false
    
    var body: some View {
        
        // If no restaurants or sights in ContentModel
        if model.restaurants.count == 0 && model.sights.count == 0 {
            // Waiting on data
            ProgressView()
        }
        else {
            
            // Determine if to show ListView or MapView
            if isMapShowing {
                // TODO: Show MapView
                
            }
            else {
                // Show ListView
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "location")
                        Text("San Francisco")
                        Spacer()
                        Text("Switch to Map View")
                    }
                    Divider()
                    
                    BusinessList()
                }
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
