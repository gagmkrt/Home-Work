//
//  ProductViewController.swift
//  Home Work
//
//  Created by Gag Mkrtchyan on 7/10/20.
//  Copyright © 2020 Gag Mkrtchyan. All rights reserved.
//

import UIKit
import Alamofire

class ProductViewController: UIViewController {
    
    @IBOutlet weak var productView: UITableView!
    
    let getProduct = "Product/GetInterested"
    var interestedArray = [InterestedModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productView.delegate = self
        productView.dataSource = self
        
        getRequest()
        
    }
    
      
        
    
    func getRequest() {
        
        let parametr : [String : Any] = [
            "count": 10,
            "page": 1
            
        ]
        
        
                
        NewWorkService.request(url: getProduct, method: .post, params: parametr, encoding: JSONEncoding.default) { (resp: PagingModels<InterestedModel>) in
            
            self.interestedArray = resp.list
            self.productView.reloadData()
        }
    }

}

extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interestedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = productView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        
        cell.setData(interestedModel: interestedArray[indexPath.row])
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Product2ViewController") as! Product2ViewController
        
        vc.prodId = interestedArray[indexPath.row].id
        present(vc, animated: true, completion: nil)
        
    }
    
    
    
}


extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
