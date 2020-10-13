//
//  Product.swift
//  MercadoAli
//
//  Created by Ali Ahmadian shalchi on 11/10/2020.
//

import Foundation

struct Response: Codable {
    
    let results: [Product]
    
    struct Product: Codable {
        
        let id: String?
        let title: String?
        let price: Double?
        let thumbnail: String?
        let condition: String?
        let availableQuantity: Int?
        
    }
    
}




