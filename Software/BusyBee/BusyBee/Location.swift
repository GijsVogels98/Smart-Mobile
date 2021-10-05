//
//  Locations.swift
//  BusyBee
//
//  Created by Gijs Vogels on 03/10/2021.
//

import Foundation

struct Location: Decodable, Identifiable {
    let id: Int
    let name: String
    let latitude: Double
    let longitude: Double
    
    static let example = Location(id: 1, name: "test", latitude: 20, longitude: 20)
    
}
