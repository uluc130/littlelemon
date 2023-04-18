//
//  MenuListView.swift
//  Restaurant
//
//  Created by Uluç Hoşgelen on 22.04.2023.
//

import SwiftUI

struct MenuListView: View {
    let dish: Dish
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(dish.title ?? "")
                    .font(.headline)
                Text(dish.dishDescription ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                Text(dish.dishPrice.formatted(.currency(code: "USD")) )
                    .foregroundColor(Color("Primary1"))
            }
            Spacer()
            VStack(alignment: .trailing){
                AsyncImage(url: URL(string: dish.image ?? "")){ image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                    
            }
        }
    }
}

//struct MenuListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuListView()
//    }
//}
