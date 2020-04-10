//
//  Cart.swift
//  ShoeShock
//
//  Created by Mohammad Shayan on 4/9/20.
//  Copyright © 2020 Mohammad Shayan. All rights reserved.
//

import Foundation

struct Cart {
    private(set) public var cartDictionary: [Shoe: Int]
    private var _cartPrice: Double
    var cartPrice: Double {
        return _cartPrice
    }
    
    init() {
        cartDictionary = [Shoe: Int]()
        _cartPrice = 0.0
    }
    
    mutating func addShoe(_ shoe: Shoe) {
        if let number = cartDictionary[shoe] {
            cartDictionary[shoe] = number + 1
        } else {
            cartDictionary[shoe] = 1
        }
        updatePrice()
    }
    
    mutating func removeOneShoe(_ shoe: Shoe) {
        if let number = cartDictionary[shoe] {
            cartDictionary[shoe] = number - 1
            if cartDictionary[shoe] == 0 {
                cartDictionary[shoe] = nil
            }
        }
        updatePrice()
    }
    
    mutating func updatePrice() {
        var totalPrice = 0.0
        for (shoe, quantity) in cartDictionary {
            totalPrice += (shoe.price * Double(quantity))
        }
        _cartPrice = totalPrice
    }
    
    func getNumberOfItems() -> Int {
        return cartDictionary.count
    }
    
    mutating func reset() {
        self.cartDictionary.removeAll()
    }
}
