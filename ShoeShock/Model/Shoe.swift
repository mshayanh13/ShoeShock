//
//  Shoe.swift
//  ShoeShock
//
//  Created by Mohammad Shayan on 4/9/20.
//  Copyright © 2020 Mohammad Shayan. All rights reserved.
//

import Foundation

struct Shoe: Hashable {
    private(set) public var name: String
    private(set) public var price: Double
    private(set) public var imageName: String
    
    init(name: String, price: Double, imageName: String) {
        self.name = name
        self.price = price
        self.imageName = imageName
    }
}
