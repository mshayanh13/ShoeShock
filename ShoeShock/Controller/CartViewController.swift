//
//  CartViewController.swift
//  ShoeShock
//
//  Created by Mohammad Shayan on 4/9/20.
//  Copyright © 2020 Mohammad Shayan. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var totalItemsLabel: UILabel!
    @IBOutlet weak var cartTable: UITableView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var purchaseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTable.delegate = self
        cartTable.dataSource = self
        updateLabels()
    }
    
    func updateLabels() {
        let shoes = DataService.instance.getShoesForCart()
        totalItemsLabel.text = "Total Items: \(shoes.count)"
        priceLabel.text = DataService.instance.getTotalPriceString()
        
        if DataService.instance.getTotalPrice() == 0.0 {
            purchaseButton.isEnabled = false
        } else {
            purchaseButton.isEnabled = true
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let shoes = DataService.instance.getShoesForCart()
        return shoes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell") as? CartTableViewCell {
            let shoe = DataService.instance.getShoesForCart()[indexPath.row]
            cell.updateCell(shoe: shoe, quantity: DataService.instance.getCart().cartDictionary[shoe]!)
            cell.decBtnTapAction = {
                DataService.instance.removeOneShoeFromCart(shoe)
                if let _ =  DataService.instance.getCart().cartDictionary[shoe] {
                        tableView.reloadRows(at: [indexPath], with: .none)
                } else {
                    tableView.deleteRows(at: [indexPath], with: .none)
                }
                self.updateLabels()
            }
            cell.incBtnTapAction = {
                DataService.instance.addShoeToCart(shoe)
                tableView.reloadRows(at: [indexPath], with: .none)
                self.updateLabels()
            }
            return cell
        } else {
            return CartTableViewCell()
        }
    }
    
    @IBAction func purchaseButtonTapped(_ sender: UIButton) {
        DataService.instance.emptyCart()
        showPurchaseCompleteConfirmationAndGoBack()
    }

}
