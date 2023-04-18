//
//  Home.swift
//  Restaurant
//
//  Created by Uluç Hoşgelen on 18.04.2023.
//

import SwiftUI

struct Home: View {
    let persistenceController = PersistenceController.shared
    @Binding var isLoggedin: Bool
  
    
    var body: some View {
        
//        TabView{
//            Menu(isLoggedin: $isLoggedin)
//                .tabItem({Label("Menu", systemImage: "list.dash")})
//            UserProfile(isLoggedIn: $isLoggedin)
//                .tabItem({Label("Profile", systemImage: "square.and.pencil")})
//
//        }
        Menu(isLoggedin: $isLoggedin)
        .navigationBarBackButtonHidden(true)
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
        
    }
}

//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//    }
//}
