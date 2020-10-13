//
//  Double+Extension.swift
//  MercadoAli
//
//  Created by Ali Ahmadian shalchi on 12/10/2020.
//

import Foundation

extension Double {
    func formattedAmount() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
