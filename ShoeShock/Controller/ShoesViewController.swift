//
//  ShoesViewController.swift
//  ShoeShock
//
//  Created by Mohammad Shayan on 4/9/20.
//  Copyright © 2020 Mohammad Shayan. All rights reserved.
//

import UIKit

class ShoesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var shoesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shoesCollectionView.delegate = self
        shoesCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataService.instance.getShoes().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shoeCell", for: indexPath) as? ShoeCollectionViewCell {
            let shoe = DataService.instance.getShoes()[indexPath.row]
            cell.btnTapAction = {
                DataService.instance.addShoeToCart(shoe)
                self.showAddToCartConfirmation()
            }
            cell.updateCellWith(shoe: shoe)
            return cell
        } else {
            return ShoeCollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoe = DataService.instance.getShoes()[indexPath.row]
        performSegue(withIdentifier: "ShoeVC", sender: shoe)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let shoeVC = segue.destination as? ShoeDetailViewController, let shoe = sender as? Shoe{
            let barBtn = UIBarButtonItem()
            barBtn.title = ""
            navigationItem.backBarButtonItem = barBtn
            
            shoeVC.initShoe(shoe)
        }
    }
    
    @IBAction func cartButtonTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "CartVC", sender: nil)
    }
    
}
