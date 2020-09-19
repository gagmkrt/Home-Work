//
//  MyTableViewCell.swift
//  Home Work
//
//  Created by Gag Mkrtchyan on 6/29/20.
//  Copyright © 2020 Gag Mkrtchyan. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
  
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var street: UILabel!
    @IBOutlet weak var building: UILabel!
    @IBOutlet weak var floor: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var apt: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setCells(addressModel: AddressModel) {
        
        address.text = addressModel.city
        street.text = addressModel.street
        building.text = addressModel.buliding
        floor.text = String(addressModel.floor ?? 0)
        phoneNumber.text = addressModel.phoneNumber
        apt.text = String(addressModel.appartment ?? 0)
    }
   
}
