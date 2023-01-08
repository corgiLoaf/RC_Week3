//
//  DBManager.swift
//  RC_week3
//
//  Created by 예은 on 2023/01/07.
//

import UIKit
import CoreData

class DBManager{
    static let share = DBManager()
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "RC_week3")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }) //completion Handler
        return container
    }()

    // MARK: - Core Data Saving support
    lazy var context = persistentContainer.viewContext
    func saveContext () {
        if context.hasChanges {
            do{
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
//    func fetchItems() -> [Item]
//    {
//        var Items = [Item]()
//
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Item.description())
//
//        do{
//            Items = try context.fetch(fetchRequest) as! [Item]
//        }catch{
//            print("fetching error")
//        }
//        return Items
//    }
    func fetchItems() -> [Item]
    {
        let fetchRequest = NSFetchRequest<Item>(entityName: Item.description())
        
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("fetching error", error)
            return []
        }
    }
    
}
