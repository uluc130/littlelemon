//
//  MenuList.swift
//  Restaurant
//
//  Created by Uluç Hoşgelen on 19.04.2023.
//

import Foundation
import CoreData

struct MenuList: Decodable{
    let menu: [MenuItem]
    
//static func getMenuData(_ viewContext:NSManagedObjectContext){
//        PersistenceController.shared.clear()
//
//        let urlString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
//        let url = URL(string: urlString)!
//
//        let urlRequest = URLRequest(url: url)
//        let task = URLSession.shared.dataTask(with: urlRequest){ data, response, error in
//            if let data = data{
//                let decoder = JSONDecoder()
//                do {
//                    let fullMenu = try decoder.decode(MenuList.self, from: data)
//                   print("Success")
//
//                    for menuItem in fullMenu.menu{
//                        let newDish = Dish(context: viewContext)
//                        newDish.title = menuItem.title
//                        newDish.dishDescription = menuItem.dishDescription
//                        newDish.price = String(menuItem.price)
//                        newDish.image = menuItem.image
//                        newDish.category = menuItem.category
//
//                    }
//                    try? viewContext.save()
//
//
//                }catch{
//                    print(error)
//
//                }
//            }
//
//        }
//        task.resume()
//    }
    static func getMenuData(viewContext: NSManagedObjectContext) {
        PersistenceController.shared.clear()
       
        
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                if let fullMenu = try? decoder.decode(MenuList.self, from: data) {
                    for dish in fullMenu.menu {
                        let newDish = Dish(context: viewContext)
                        newDish.title = dish.title
                        newDish.price = dish.price
                        newDish.dishDescription = dish.dishDescription
                        newDish.image = dish.image
                        newDish.category = dish.category
                    }
                    try? viewContext.save()
                } else {
                    print(error.debugDescription.description)
                }
            } else {
                print(error.debugDescription.description)
            }
        }
        dataTask.resume()
    }

}
