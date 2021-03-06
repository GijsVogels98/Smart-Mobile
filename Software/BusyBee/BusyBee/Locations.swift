//
//  Locations.swift
//  BusyBee
//
//  Created by Gijs Vogels on 03/10/2021.
//

import Foundation

class Locations: ObservableObject{
    let places: [Location]
    
    var primary: Location{
        places[0]
    }
    
    init(){
        let url = Bundle.main.url(forResource: "locations" , withExtension: "json")!
        let data = try! Data(contentsOf: url)
        places = try! JSONDecoder().decode([Location].self, from: data)
    }
}

//
//let jsonString = "{"location": "the moon"}"
//
//if let documentDirectory = FileManager.default.urls(for: .documentDirectory,
//                                                    in: .userDomainMask).first {
//    let pathWithFilename = documentDirectory.appendingPathComponent("myJsonString.json")
//    do {
//        try jsonString.write(to: pathWithFilename,
//                             atomically: true,
//                             encoding: .utf8)
//    } catch {
//        // Handle error
//    }
//}
