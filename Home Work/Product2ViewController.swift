//
//  ProductViewController.swift
//  Home Work
//
//  Created by Gag Mkrtchyan on 7/20/20.
//  Copyright © 2020 Gag Mkrtchyan. All rights reserved.
//

import UIKit
import Alamofire

class Product2ViewController: UIViewController {
        
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var categoryId: UILabel!
    @IBOutlet weak var descriptions: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var length: UILabel!
    @IBOutlet weak var width: UILabel!
    @IBOutlet weak var countInBlock: UILabel!
    @IBOutlet weak var volume: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var images: UIImageView!
    
   
    
    @IBAction func closeProd(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    var prodId: Int?    
    let getProductById = "Product/Get/"
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRequest()
        
    }
    
    
    func getRequest() {
        
        guard let id = prodId else { return }
        
        NewWorkService.request(url: getProductById + String(id), method: .get, params: nil, encoding: JSONEncoding.default) { (resp: ProdModel) in
            
            self.idLabel.text = String(resp.id)
            self.nameLabel.text = resp.name
            self.category.text = resp.category
            self.categoryId.text = String(resp.categoryID ?? 0)
            self.descriptions.text = resp.description
            self.width.text = String(resp.weight ?? 0)
            self.height.text = String(resp.height ?? 0)
            self.length.text = String(resp.length ?? 0)
            self.width.text = String(resp.width ?? 0)
            self.countInBlock.text = String(resp.countInBlock ?? 0)
            self.volume.text = String(resp.volume ?? 0)
            self.price.text = String(resp.price ?? 0)
            
            if let photo = resp.photo, let url = URL(string: photo) {
                self.images.load(url: url)
            }
            
            
        }
    }
    
  
}


