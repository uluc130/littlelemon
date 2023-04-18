//
//  Category.swift
//  Restaurant
//
//  Created by Uluç Hoşgelen on 22.04.2023.
//

import SwiftUI

struct Category: View {
    let categories = ["All", "starters", "mains", "desserts", "drinks"]
    @Binding var selectedCategory: String
    
    
    var body: some View {
        VStack(alignment:.leading) {
            Text("ORDER FOR DELIVERY")
                .font(.headline).bold()
                .padding([.leading, .top, .trailing], 15)
        
            NavigationStack {
                ScrollView(.horizontal){
                    HStack(spacing: 10) {
                        ForEach(categories, id: \.self) {item in
                            Text(item)
                                .padding(10)
                                .background(item == selectedCategory ? Color("Primary1"): Color("highlight1"))
                                .foregroundColor(item == selectedCategory ? Color("highlight1"): Color("Primary1"))
                                .font(.headline)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .padding([.top, .bottom], 5)
                                .onTapGesture {
                                    selectedCategory = item
                                }
                        }
                        
                    }
                }
            }
            
        }
        .padding(.bottom, 5)
        .scrollIndicators(.hidden)
        Divider()
        }
    }


//struct Category_Previews: PreviewProvider {
//    static var previews: some View {
//        Category()
//    }
//}
