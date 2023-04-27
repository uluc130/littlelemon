//
//  Header.swift
//  Restaurant
//
//  Created by Uluç Hoşgelen on 20.04.2023.
//

import SwiftUI

struct Header: View {
    @Environment(\.presentationMode) var presentation
    @Binding var isLoggedin: Bool
    
    
    var body: some View {
                ZStack {
                        Image("littleLemon")
                            .resizable()
                            .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 40)
                    
                    
                    HStack {
                       
                        Spacer()
                        if isLoggedin == true{
                            
                            NavigationLink(destination: UserProfile(isLoggedIn: $isLoggedin)){
                                Image("Profile")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .padding(.trailing)
                            }
                            
                        }
                    }
                }
                .onAppear{
                    
                    
                }
            
        
    }
}

//struct Header_Previews: PreviewProvider {
//    static var previews: some View {
//        Header()
//    }
//}
