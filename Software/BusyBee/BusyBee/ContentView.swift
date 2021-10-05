//
//  ContentView.swift
//  BusyBee
//
//  Created by Gijs Vogels on 03/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    let location: Location
    
    var body: some View {
        Text(location.name)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(location: Location.example)
    }
}
