//
//  Product2TableViewCell.swift
//  Home Work
//
//  Created by Gag Mkrtchyan on 7/20/20.
//  Copyright © 2020 Gag Mkrtchyan. All rights reserved.
//

import UIKit

class Product2TableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setCells(productCategorys: ProductCategories) {
        
//        name.text = productCategorys.name
    }
}
