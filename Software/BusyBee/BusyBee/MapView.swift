//
//  MapView.swift
//  BusyBee
//
//  Created by Gijs Vogels on 03/10/2021.
//

import MapKit
import SwiftUI
import Combine

struct MapView: View {
    @EnvironmentObject var locations: Locations
    @ObservedObject var locationmanager = LocationManager()
    @State private var cancellable : AnyCancellable?
    
    
    
    
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
        span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40)
    )
    

    
    func setCurrentLocation (){
        cancellable = locationmanager.$location.sink{ location in
            region = MKCoordinateRegion(center: location?.coordinate ?? CLLocationCoordinate2D(), latitudinalMeters: 500, longitudinalMeters:   500)
        }
    }
    
    var body: some View {
        VStack{
            Map(coordinateRegion: $region,interactionModes: .all, showsUserLocation: true, userTrackingMode: nil,
                annotationItems: locations.places){
                location in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)){
                    NavigationLink(destination:ContentView(location: location)) {
                        Image("marker")
                    }
                }
            }.navigationTitle("Locations")
//            }
        }.onAppear{
            setCurrentLocation()
        }
        
        
       
        
       
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
