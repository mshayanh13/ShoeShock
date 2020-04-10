//
//  DataService.swift
//  ShoeShock
//
//  Created by Mohammad Shayan on 4/9/20.
//  Copyright © 2020 Mohammad Shayan. All rights reserved.
//

import Foundation

class DataService {
    static let instance = DataService()
    
    private let shoes = [
        Shoe(name: "One", price: 1.0, imageName: "one.jpg"),
        Shoe(name: "Two", price: 2.0, imageName: "two.jpg"),
        Shoe(name: "Three", price: 3.0, imageName: "three.jpg"),
        Shoe(name: "Four", price: 4.0, imageName: "four.jpg"),
        Shoe(name: "Six", price: 6.0, imageName: "six.jpg"),
        Shoe(name: "Seven", price: 7.0, imageName: "seven.jpg"),
        Shoe(name: "Eight", price: 8.0, imageName: "eight.jpg")
    ]
    
    private var cart = Cart()
    
    func getShoes() -> [Shoe] {
        return shoes
    }
    
    func getShoesForCart() -> [Shoe] {
        return Array(cart.cartDictionary.keys)
    }
    
    func getCart() -> Cart {
        return cart
    }
    
    func getTotalPriceString() -> String {
        return cart.cartPrice.convertToCurrencyString()
    }
    
    func getTotalPrice() -> Double {
        return cart.cartPrice
    }
    
    func addShoeToCart(_ shoe: Shoe) {
        cart.addShoe(shoe)
    }
    
    func removeOneShoeFromCart(_ shoe: Shoe) {
        cart.removeOneShoe(shoe)
    }
    
    func emptyCart() {
        cart.reset()
    }
}
