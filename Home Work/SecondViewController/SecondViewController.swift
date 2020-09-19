//
//  SecondViewController.swift
//  Home Work
//
//  Created by Gag Mkrtchyan on 6/29/20.
//  Copyright © 2020 Gag Mkrtchyan. All rights reserved.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var floorTextField: UITextField!
    @IBOutlet weak var appartmentTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var buildingTextField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    let addressCreat = "Address/Create"
    let getAllAddresses = "Address/GetAll"
    
    weak var delegate : AddAddress?
    
   
    @IBAction func saveButton(_ sender: UIButton) {
        
        restAPI()
        
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tapAndClose(_ sender: UITapGestureRecognizer) {
        addressTextField.resignFirstResponder()
        streetTextField.resignFirstResponder()
        buildingTextField.resignFirstResponder()
        floorTextField.resignFirstResponder()
        appartmentTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addressTextField.placeholder = "Enter address"
        streetTextField.placeholder = "Enter street"
        buildingTextField.placeholder = "Enter building"
        floorTextField.placeholder = "Enter floor"
        appartmentTextField.placeholder = "Enter appartment"
        phoneTextField.placeholder = "Enter phone number"
        
        self.addressTextField.delegate = self
        self.floorTextField.delegate = self
        self.appartmentTextField.delegate = self
        self.phoneTextField.delegate = self
        self.streetTextField.delegate = self
        self.buildingTextField.delegate = self

//        scrollView.keyboardDismissMode = .onDrag
        scrollView.isScrollEnabled = false
    }
    
    func restAPI() {
        
        let parametrs: [String: Any] = [
            "city": addressTextField.text!,
            "street": streetTextField.text!,
            "buliding": buildingTextField.text!,
            "floor": floorTextField.text!,
            "appartment": appartmentTextField.text!,
            "phoneNumber": phoneTextField.text!,
        ]
        
        NewWorkService.request(url: addressCreat, method: .post, params: parametrs, encoding: JSONEncoding.default) { (resp: Bool) in
            
        }
        self.dismiss(animated: true, completion: {
            self.delegate?.addressDidAdd()
        })
    }
    
    
}
