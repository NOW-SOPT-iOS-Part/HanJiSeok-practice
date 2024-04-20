//
//  ProductItem.swift
//  34th-Sopt-Seminar
//
//  Created by 한지석 on 4/20/24.
//

import Foundation
import UIKit

struct Product {
    let productImage: UIImage
    let name: String
    let price: String
    var isLiked: Bool
}

extension Product {
    static let MockData: [Product] = [
        Product(productImage: .product1, name: "호날두", price: "8,000원", isLiked: false),
        Product(productImage: .product2, name: "머드리치", price: "8,000원", isLiked: false),
        Product(productImage: .product3, name: "키미", price: "8,000원", isLiked: false),
        Product(productImage: .product4, name: "카이세도", price: "8,000원", isLiked: false),
        Product(productImage: .product5, name: "팔머", price: "8,000원", isLiked: false)
    ]
}
