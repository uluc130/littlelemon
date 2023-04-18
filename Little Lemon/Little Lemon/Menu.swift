//
//  Menu.swift
//  Restaurant
//
//  Created by Uluç Hoşgelen on 18.04.2023.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
//    @State private var menu = MenuList()
    @State private var searchText = ""
    @State private var selectedCategory = "All"
    @Binding var isLoggedin: Bool
    @State private var isMenuLoaded = false
    
    var body: some View {
        VStack{
            Header(isLoggedin: $isLoggedin)
            Hero(searchText: $searchText)
                .frame(height: 260)
            Category(selectedCategory: $selectedCategory)
                
 
                FetchedObjects(
                    predicate: buildPredicate(),
                    sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                        
                            List(dishes){ dish in
                                    NavigationLink{
                                        FoodDetail(dish:dish, isLoggedIn: $isLoggedin)
                                    } label: {
                                        
                                    MenuListView(dish: dish)
                                    }
                            }
                            .listStyle(.inset)
                        
                    }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear{
            if !isMenuLoaded{
                MenuList.getMenuData(viewContext: viewContext)
                isMenuLoaded = true
            }
        }
    }
    
    func buildSortDescriptors()->[NSSortDescriptor]{
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare(_:)))]
    }
    
    func buildPredicate()->NSPredicate{
        if searchText == ""{
            if selectedCategory == "All"{
                return NSPredicate(value: true)
            }else{
                return NSPredicate(format: "category CONTAINS[CD] %@", selectedCategory)
            }
        }else{
            if selectedCategory == "All"{
                return NSPredicate(format: "title CONTAINS[CD] %@", searchText)
            }else{
                return  NSPredicate(format: "(category == %@) AND (title CONTAINS[CD]  %@)",selectedCategory, searchText)
            }
        }
            
           
    }
}

//struct Menu_Previews: PreviewProvider {
//    static var previews: some View {
//        Menu()
//    }
//}
