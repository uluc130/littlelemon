//
//  MenuItem.swift
//  Restaurant
//
//  Created by Uluç Hoşgelen on 19.04.2023.
//

import Foundation

struct MenuItem: Codable{
    enum CodingKeys: String, CodingKey { case
        title, price, image, category, dishDescription = "description"
    }
    var id = UUID()
    let title: String
    let dishDescription: String
    let price: String
    let image: String
    let category: String
}
