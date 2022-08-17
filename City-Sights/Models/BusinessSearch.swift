//
//  BusinessSearch.swift
//  City-Sights
//
//  Created by Grant Davis on 7/29/22.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total = 0
    var region = Region()
}

struct Region: Decodable {
    var center = Coordinates()
}

class Business: Decodable, Identifiable, ObservableObject {
    
    @Published var imageData: Data?
    
    var id: String?
    var alias: String?
    var name: String?
    var imageURL: String?
    var isClosed: Bool?
    var url: String?
    var reviewCount: Int?
    var categories: [Category]?
    var rating: Double?
    var location: Location?
    var coordinates: Coordinates?
    var transactions: [String]?
    var price: String?
    var phone: String?
    var displayPhone: String?
    var distance: Double?
    
    enum CodingKeys: String, CodingKey {
        
        case imageURL = "image_url"
        case isClosed = "is_closed"
        case reviewCount = "review_count"
        case displayPhone = "display_phone"
        
        case id
        case alias
        case name
        case url
        case categories
        case rating
        case coordinates
        case transactions
        case price
        case location
        case phone
        case distance
    }
    
    func getImageData() {
        
        // Check imageURL is not nil
        guard imageURL != nil else {
            print("imageURL is nil")
            return
        }
        
        // Download data from URL
        if let url = URL(string: imageURL!) {
            
            // Get session
            let session = URLSession.shared
            
            // Create dataTask
            let dataTask = session.dataTask(with: url) { data, response, error in
                
                guard error == nil else {
                    print(error)
                    return
                }
                
                DispatchQueue.main.async {
                    self.imageData = data!
                }
                
            }
            
            dataTask.resume()
        }
        
    }
    
}

struct Location: Decodable {
    
    var address1: String?
    var address2: String?
    var address3: String?
    var city: String?
    var zipCode: String?
    var country: String?
    var state: String?
    var displayAddress: [String]?

    enum CodingKeys: String, CodingKey {
        
        case zipCode = "zip_code"
        case displayAddress = "display_address"
        
        case address1
        case address2
        case address3
        case city
        case country
        case state
    }
    
}

struct Coordinates: Decodable {
    
    var latitude: Double?
    var longitude: Double?
}

struct Category: Decodable {
    
    var alias: String?
    var title: String?
}
