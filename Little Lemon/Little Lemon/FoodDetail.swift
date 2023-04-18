//
//  FoodDetail.swift
//  Restaurant
//
//  Created by Uluç Hoşgelen on 27.04.2023.
//

import SwiftUI

struct FoodDetail: View {
    @Environment(\.presentationMode) var presentation
    let dish:Dish
    @Binding var isLoggedIn : Bool
    
    var body: some View {
        ZStack {
            HStack {
                Button{
                    presentation.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.backward.circle.fill")
                        .resizable()
                        .foregroundColor(Color("Primary1"))
                        .frame(width: 30, height: 30)
                    
                }
                .padding(.leading)
                Spacer()
                
            }
            Header(isLoggedin: $isLoggedIn)
        }
        ScrollView {
            AsyncImage(url: URL(string: dish.image ?? "")){ image in
                image
                    .resizable()
                    .scaledToFit()
                
            } placeholder: {
                ProgressView()
            }
            
            .frame(minHeight:200)
            
            VStack{
                Text(dish.title ?? "")
                    .font(.headline)
                Spacer()
                Text(dish.dishDescription ?? "")
                    .font(.subheadline)
                Text(dish.dishPrice.formatted(.currency(code: "USD")) )
                    .foregroundColor(Color("Primary1"))
            }
            .padding(10)
            Spacer()
        }
        
        .navigationBarBackButtonHidden(true)
    }
}

//struct FoodDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        FoodDetail()
//    }
//}
