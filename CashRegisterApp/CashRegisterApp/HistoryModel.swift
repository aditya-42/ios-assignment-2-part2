//
//  HistoryModel.swift
//  CashRegisterApp
//
//  Created by Aditya Purohit on 17/10/24.
//

import Foundation


class HistoryModel{
    var name:String = ""
    var quantity:Int = 0
    var price:Double = 0.0
    var purchaseDate:Date
    
    // Constructor
    
    init(name: String, quantity: Int, price: Double, purchaseDate: Date = Date()) {
        self.name = name
        self.quantity = quantity
        self.price = price
        self.purchaseDate = purchaseDate
    }
    
    func toString() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        let dateString = dateFormatter.string(from: purchaseDate)
        return "\(name) \(quantity) \(price) \(dateString)"
    }
}

