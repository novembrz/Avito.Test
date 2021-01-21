//
//  ProductsModel.swift
//  AvitoTest
//
//  Created by Дарья on 21.01.2021.
//

import Foundation

struct ProductsModel: Decodable {
    let result: Result
}

struct Result: Decodable {
    let title: String
    let selectedActionTitle: String
    let list: [List]
}

struct List: Decodable {
    let title: String
    let description: String?
    let price: String
    let isSelected: Bool
    let icon: Icon
}

struct Icon: Decodable {
    let url: String
    
    enum CodingKeys: String, CodingKey{
        case url = "52x52"
    }
}
