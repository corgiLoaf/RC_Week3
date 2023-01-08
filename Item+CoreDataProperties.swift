//
//  Item+CoreDataProperties.swift
//  RC_week3
//
//  Created by 예은 on 2023/01/07.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var title: String?
    @NSManaged public var price: String?
    @NSManaged public var post: String?
    @NSManaged public var image: Data?

}

extension Item : Identifiable {

}
