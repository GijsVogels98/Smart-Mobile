//
//  BusyBeeApp.swift
//  BusyBee
//
//  Created by Gijs Vogels on 03/10/2021.
//

import SwiftUI

@main
struct BusyBeeApp: App {
    
    @StateObject var locations = Locations()
    
    var body: some Scene {
        
        WindowGroup {
            NavigationView {
                LoginView()
            }.environmentObject(locations)
           
        }
        WindowGroup{
            NavigationView {
                MapView()
            }.environmentObject(locations)
//            .tabItem {
//                Image(systemName: "star.fill")
//                Text("Locations")
//            }
        }
        WindowGroup{
            NavigationView{
                    ContentView(location: locations.primary)
                }.environmentObject(locations)
        }
    }
}



