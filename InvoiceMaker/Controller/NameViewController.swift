//
//  NameViewController.swift
//  InvoiceMaker
//
//  Created by Sajid Hasan on 21/6/20.
//  Copyright © 2020 Sajidd. All rights reserved.
//

import UIKit


var business = Business(name: "Business name", address: "CWC 189, Gulshan", city: "Dhaka", country: "Bangladesh")

class NameViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decorateTextField()
        decoratenextButton()

        
    }
    
    private func decorateTextField(){
        //addBottomBorder()
        nameTextField.borderStyle = .none
        nameTextField.font = UIFont.init(name: "Nunito", size: 30)
        nameTextField.placeholder = "Business name"
    }
    
    private func decoratenextButton(){
        nextButton.layer.cornerRadius = 10
    }

    @IBAction func nextbuttonPressed(_ sender: UIButton) {
        business.businessName = nameTextField.text ?? "Business Name"
        let vc = (storyboard?.instantiateViewController(withIdentifier: "AddressViewController")) as! AddressViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
    
}
