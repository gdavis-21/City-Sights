//
//  BusinessSection.swift
//  City-Sights
//
//  Created by Grant Davis on 8/3/22.
//

import SwiftUI

struct BusinessSection: View {
    
    var title: String
    var businesses: [Business]
    
    var body: some View {
        Section(header: BusinessSectionHeader(title: title))
        {
            ForEach(businesses) { business in
                
                NavigationLink(destination: BusinessDetail(business: business), label: {
                    BusinessRow(business: business)
                })
            }
        }
    }
}

