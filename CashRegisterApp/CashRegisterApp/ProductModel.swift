//
//  productModel.swift
//  CashRegisterApp
//
//  Created by Aditya Purohit on 07/10/24.
//

import Foundation

class ProductModel{
    var name:String = ""
    var quantity:Int = 0;
    var price:Double = 0.0;
    
    // Constructor
    
    init(name: String, quantity: Int, price: Double) {
        self.name = name
        self.quantity = quantity
        self.price = price
    }
    
    func toString() -> String{
        return "\(name) \(quantity) \(price)"
    }
}
