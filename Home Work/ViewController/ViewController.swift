//
//  ViewController.swift
//  Home Work
//
//  Created by Gag Mkrtchyan on 6/29/20.
//  Copyright © 2020 Gag Mkrtchyan. All rights reserved.
//

import UIKit

import Alamofire

class ViewController: UIViewController {
    
    let indicator = UIActivityIndicatorView()
    
    @IBOutlet weak var tableView: UITableView!
    
//    let dispatchGruped = DispatchGroup()
    
    let myRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        //        let title = NSLocalizedString("Wait a second", comment: "Pull to refresh")
        //        refreshControl.attributedTitle = NSAttributedString(string: title)
        
        return refreshControl
    }()
    
    
    @objc func refresh(sender: UIRefreshControl) {
       
        getRequest()
        sender.endRefreshing()
    }
    
    
    
    func indicatorAnimaiting() {
           indicator.center = self.view.center
           indicator.hidesWhenStopped = true
           view.addSubview(indicator)
           
           indicator.startAnimating()
       }
    
    
   
    @IBAction func plusButton(_ sender: UIBarButtonItem) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        vc.delegate = self
        
        present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func productButton(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    

    var addressesArray = [AddressModel]()
    var interestedArray = [InterestedModel]()

        
    let addressCreate = "Address/Create"
    let addressAll = "Address/GetAll"
    let getProduct = "Product/GetInterested"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.contentInset.top = 15
        
        getRequest()
        
        tableView.refreshControl = myRefreshControl
        
        indicatorAnimaiting()
    }
    
    
    
    private func getRequest() {
//        dispatchGruped.enter()
//        print(" is get")

        NewWorkService.request(url: addressAll, method: .get, params: nil, encoding: JSONEncoding.default) { (resp: DataModel) in
            
            self.addressesArray = resp.addresses
            self.tableView.reloadData()
//            self.dispatchGruped.leave()
            
            self.indicator.stopAnimating()
//            print("Is leave")

        }
        
    }
    
//    private func getRequest2() {
//        dispatchGruped.enter()
//        print(" is get")
//
//        NewWorkService.request(url: getProduct, method: .get, params: nil, encoding: JSONEncoding.default) { (resp: PagingModels<InterestedModel>) in
//            self.interestedArray = resp.list
//            self.dispatchGruped.leave()
////            print("Is leave")
//        }
//    }
//
//    func startRequest() {
//        getRequest()
//        getRequest2()
//        dispatchGruped.notify(queue: DispatchQueue.main) {
//
//            print("close")
//        }
//        self.tableView.reloadData()
//    }

    
}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
    
        cell.setCells(addressModel: addressesArray[indexPath.row])
        
        return cell
    
    }
    
}




extension ViewController: AddAddress {
    func addressDidAdd() {
        getRequest()
    }
    
}



protocol AddAddress: class {
   func addressDidAdd()
}
