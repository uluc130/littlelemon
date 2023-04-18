//
//  HeroOnboarding.swift
//  Restaurant
//
//  Created by Uluç Hoşgelen on 24.04.2023.
//

import SwiftUI

struct HeroOnboarding: View {
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
                         .frame(width: 150, height: 150)
                         .clipShape(RoundedRectangle(cornerRadius: 30))
                         .padding(.trailing)
                     
                }
            }
            
            
            
                    // Your other content here
                    // Other layers will respect the safe area edges
            }
    }
}

struct HeroOnboarding_Previews: PreviewProvider {
    static var previews: some View {
        HeroOnboarding()
    }
}
