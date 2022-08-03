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
    var center: Coordinates?
}

struct Business: Decodable, Identifiable {
    
    var id: String?
    var alias: String?
    var name: String?
    var image_url: String?
    var is_closed: Bool?
    var url: String?
    var review_count: Int?
    var categories: [Category]?
    var rating: Double?
    var coordinates: Coordinates?
    var transactions: [String]?
    var price: String?
    var phone: String?
    var display_phone: String?
    var distance: Double?
    
    
}

struct Location: Decodable {
    
    var address1: String?
    var address2: String?
    var address3: String?
    var city: String?
    var zip_code: String?
    var country: String?
    var state: String?
    var display_address: [String]?
}

struct Coordinates: Decodable {
    
    var latitude: Double?
    var longitude: Double?
}

struct Category: Decodable {
    
    var alias: String?
    var title: String?
}
