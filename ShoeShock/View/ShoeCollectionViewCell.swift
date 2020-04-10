//
//  ShoeCollectionViewCell.swift
//  ShoeShock
//
//  Created by Mohammad Shayan on 4/9/20.
//  Copyright © 2020 Mohammad Shayan. All rights reserved.
//

import UIKit

class ShoeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var shoeNameLabel: UILabel!
    @IBOutlet weak var shoePriceLabel: UILabel!
    @IBOutlet weak var shoeImageView: UIImageView!
    
    @IBOutlet weak var heartButton: UIButton!
    
    var btnTapAction: (() -> ())?
    
    func updateCellWith(shoe: Shoe) {
        shoeNameLabel.text = shoe.name
        shoePriceLabel.text = shoe.price.convertToCurrencyString()
        shoeImageView.image = UIImage(named: shoe.imageName)
        heartButton.addTarget(self, action: #selector(heartButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func heartButtonTapped(_ sender: UIButton) {
        btnTapAction?()
    }
}
