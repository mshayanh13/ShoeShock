//
//  Extension.swift
//  ShoeShock
//
//  Created by Mohammad Shayan on 4/10/20.
//  Copyright © 2020 Mohammad Shayan. All rights reserved.
//

import UIKit

extension Double {
    func convertToCurrencyString() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "en_US")
        return numberFormatter.string(from: NSNumber(value: self)) ?? "$0.00"
    }
}

extension UIViewController {
    func showAddToCartConfirmation() {
        let alert = UIAlertController(title: "", message: "Successfully Added To Cart", preferredStyle: .alert)
        self.present(alert, animated: true)
        
        let secondsToDismissAlert = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: secondsToDismissAlert, execute: {
            alert.dismiss(animated: true)
        })
    }
    
    func showAddToCartConfirmationAndGoBack() {
        let alert = UIAlertController(title: "", message: "Successfully Added To Cart", preferredStyle: .alert)
        self.present(alert, animated: true)
        
        let secondsToDismissAlert = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: secondsToDismissAlert, execute: {
            alert.dismiss(animated: true)
            self.navigationController?.popViewController(animated: true)
        })
    }
    
    func showPurchaseCompleteConfirmationAndGoBack() {
        let alert = UIAlertController(title: "", message: "Purchase Complete", preferredStyle: .alert)
        self.present(alert, animated: true)
        
        let secondsToDismissAlert = DispatchTime.now() + 3
        DispatchQueue.main.asyncAfter(deadline: secondsToDismissAlert, execute: {
            alert.dismiss(animated: true)
            self.navigationController?.popViewController(animated: true)
        })
    }
}
