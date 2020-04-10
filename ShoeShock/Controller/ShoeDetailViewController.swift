//
//  ShoeDetailViewController.swift
//  ShoeShock
//
//  Created by Mohammad Shayan on 4/9/20.
//  Copyright © 2020 Mohammad Shayan. All rights reserved.
//

import UIKit

class ShoeDetailViewController: UIViewController {

    @IBOutlet weak var shoeNameLabel: UILabel!
    @IBOutlet weak var shoePriceLabel: UILabel!
    @IBOutlet weak var shoeImageView: UIImageView!
    
    
    private(set) public var shoe: Shoe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpShoe()
    }

    func initShoe(_ shoe: Shoe) {
        self.shoe = Shoe(name: shoe.name, price: shoe.price, imageName: shoe.imageName)
        navigationItem.title = shoe.name
    }
    
    func setUpShoe() {
        shoeNameLabel.text = shoe.name
        shoePriceLabel.text = shoe.price.convertToCurrencyString()
        shoeImageView.image = UIImage(named: shoe.imageName)
    }
    
    @IBAction func addToCartButtonTapped(_ sender: UIButton) {
        
        DataService.instance.addShoeToCart(shoe)
        showAddToCartConfirmationAndGoBack()
    }
}
