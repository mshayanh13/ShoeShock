//
//  CartTableViewCell.swift
//  ShoeShock
//
//  Created by Mohammad Shayan on 4/10/20.
//  Copyright © 2020 Mohammad Shayan. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var shoeImageView: UIImageView!
    @IBOutlet weak var shoeNameLabel: UILabel!
    @IBOutlet weak var shoePriceLabel: UILabel!
    @IBOutlet weak var quantitiyLabel: UILabel!
    
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var increaseButton: UIButton!
    
    var incBtnTapAction: (() -> ())?
    var decBtnTapAction: (() -> ())?
    
    func updateCell(shoe: Shoe, quantity: Int) {
        shoeImageView.image = UIImage(named: shoe.imageName)
        shoeNameLabel.text = shoe.name
        shoePriceLabel.text = (shoe.price * Double(quantity)).convertToCurrencyString()
        quantitiyLabel.text = "\(quantity)"
        
        decreaseButton.addTarget(self, action: #selector(decreaseButtonTapped(_:)), for: .touchUpInside)
        increaseButton.addTarget(self, action: #selector(increaseButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func decreaseButtonTapped(_ sender: UIButton) {
        decBtnTapAction?()
    }
    
    @objc func increaseButtonTapped(_ sender: UIButton) {
        incBtnTapAction?()
    }

}
