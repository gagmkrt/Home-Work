//
//  ProductTableViewCell.swift
//  Home Work
//
//  Created by Gag Mkrtchyan on 7/10/20.
//  Copyright © 2020 Gag Mkrtchyan. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ml: UILabel!
    @IBOutlet weak var price: UILabel!    
    @IBOutlet weak var images: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setData(interestedModel: InterestedModel) {
        
        name.text = interestedModel.name
        price.text = String(interestedModel.price)
        if let url = URL(string: interestedModel.photo) {
            images.load(url: url)
        }
    }
    
    
}
