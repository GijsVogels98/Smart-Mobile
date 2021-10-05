//
//  MapView.swift
//  BusyBee
//
//  Created by Gijs Vogels on 03/10/2021.
//

import MapKit
import SwiftUI

struct MapView: View {
    @EnvironmentObject var locations: Locations
    
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
        span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40)
    )
    
    
    var body: some View {
        Map(coordinateRegion: $region,
            annotationItems: locations.places){
            location in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)){
                NavigationLink(destination:ContentView(location: location)) {
                    Image("marker")
                }
            }
        }.navigationTitle("Locations")
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
