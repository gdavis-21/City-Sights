//
//  BusinessRow.swift
//  City-Sights
//
//  Created by Grant Davis on 8/3/22.
//

import SwiftUI

struct BusinessRow: View {
    
    @ObservedObject var business: Business
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                // Image
                if let uiImage = UIImage(data: business.imageData ?? Data()) {
                    Image(uiImage: uiImage)
                        .frame(width: 58, height: 58)
                        .cornerRadius(5)
                }
                
                // Name & distance
                VStack(alignment: .leading) {
                    Text(business.name ?? "")
                        .bold()
                    Text(String(format: "%.1f km away", (business.distance ?? 0)/1000))
                        .font(.caption)
                }
                
                Spacer()
                
                // Rating and # of reviews
                VStack(alignment: .leading) {
                    Image("regular_\(business.rating ?? 0)")
                    Text("\(business.reviewCount ?? 0) Reviews")
                        .font(.caption)
                }

            }
            Divider()
        }
    }
}
