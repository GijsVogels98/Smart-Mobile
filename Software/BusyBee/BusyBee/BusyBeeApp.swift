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
    let persistenceContainer = PersistenceController.shared
    
    
    var body: some Scene {
        
        WindowGroup {
            NavigationView {
                LoginView()
            }.environmentObject(locations)
           
        }
        WindowGroup{
            NavigationView{
                MapView()
            }.environmentObject(locations)
//            .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
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



