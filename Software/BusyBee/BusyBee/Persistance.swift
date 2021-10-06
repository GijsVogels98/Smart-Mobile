//
//  Persistance.swift
//  BusyBee
//
//  Created by Gijs Vogels on 05/10/2021.
//


import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(){
        container = NSPersistentContainer(name:"MovieMatcher")

        container.loadPersistentStores{(storeDescription, error) in
            if let error = error as NSError?{
                fatalError("Unresolved error: \(error)")
            }
        }
    }
}
