//
//  CollectionModel.swift
//  Week1_practice
//
//  Created by 신혜연 on 5/2/25.
//

import UIKit

struct ItemModel {
    let itemImg: UIImage
    let name: String
    let price: String
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(itemImg: .product1, name: "퉁퉁퉁사후르", price: "5000"),
            ItemModel(itemImg: .product2, name: "오쏘몰", price: "5000"),
            ItemModel(itemImg: .product3, name: "애플워치", price: "5000"),
            ItemModel(itemImg: .product4, name: "가방", price: "5000"),
            ItemModel(itemImg: .product5, name: "헤드셋", price: "5000"),
            ItemModel(itemImg: .product6, name: "틴트", price: "5000"),
            ItemModel(itemImg: .product7, name: "카메라", price: "5000"),
            ItemModel(itemImg: .product8, name: "로션", price: "5000"),
            ItemModel(itemImg: .product1, name: "락스", price: "5000"),
            ItemModel(itemImg: .product4, name: "가방", price: "5000"),
            ItemModel(itemImg: .product5, name: "헤드셋", price: "5000"),
            ItemModel(itemImg: .product6, name: "틴트", price: "5000")
        ]
    }
}
