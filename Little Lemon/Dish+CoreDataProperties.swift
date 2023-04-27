//
//  Dish+CoreDataProperties.swift
//  Restaurant
//
//  Created by Uluç Hoşgelen on 19.04.2023.
//
//

import Foundation
import CoreData


extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var title: String?
    @NSManaged public var image: String?
    @NSManaged public var price: String?
    @NSManaged public var dishDescription: String?
    @NSManaged public var category: String?
    
    public var dishPrice: Double {
        return Double(price!) ?? 0.0
        
        
    }

}

extension Dish : Identifiable {

}
