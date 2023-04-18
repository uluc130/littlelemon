//
//  Hero.swift
//  Restaurant
//
//  Created by Uluç Hoşgelen on 20.04.2023.
//

import SwiftUI

struct Hero: View {
    @Binding var searchText :String
    var body: some View {
        ZStack {
            Color("Primary1")
                .ignoresSafeArea()
            VStack {
                HStack{
                    VStack(alignment: .leading){
                        Text("Little Lemon")
                            .foregroundColor(Color("approvedYellow"))
                            .font(.title.bold())
                            
                            
                        Text("Chicago")
                            .font(.title2.bold())
                            .foregroundColor(.white)
                        Divider()
                        Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                            .foregroundColor(.white)
                    }
                    .padding(.leading, 10)
                    Spacer()
                    Image("heroImage")
                         .resizable()
                         .scaledToFill()
                         .frame(width: 120, height: 120)
                         .clipShape(RoundedRectangle(cornerRadius: 30))
                         .padding(.trailing)
                     
                }
                TextField("Search...", text:$searchText )
                    .padding(5)
                    .frame(minHeight: 30)
                    .background(.white)
                    .cornerRadius(5)
                    .padding([.bottom, .leading, .trailing], 10)
                    .offset(y: 10)
            }
            
            
            
                    // Your other content here
                    // Other layers will respect the safe area edges
            }
    }
     
}

//struct Hero_Previews: PreviewProvider {
//    static var previews: some View {
//        Hero(searchText: )
//    }
//}
