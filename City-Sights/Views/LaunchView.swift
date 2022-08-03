//
//  LaunchView.swift
//  City-Sights
//
//  Created by Grant Davis on 7/20/22.
//

import SwiftUI
import CoreLocation

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        // Detect user's authorization status
        if model.authorizationState == .notDetermined {
            // Show OnboardingView
        }
        else if model.authorizationState == .authorizedWhenInUse || model.authorizationState == .authorizedAlways {
            // Show HomeView
            HomeView()
        }
        
        // If undetermined, show Onboarding
        
        // If approved, show HomeView
        
        // If denied, show ErrorView
        
        
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
