//
//  AddressViewController.swift
//  InvoiceMaker
//
//  Created by Sajid Hasan on 21/6/20.
//  Copyright © 2020 Sajidd. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decorateTextField(tf: addressTextField)
        nextButton.layer.cornerRadius = 10
        
        loadSingletapGestureRecognizer()
        
        print("Business name:", business.businessName)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        business.businessAddress = addressTextField.text ?? "CWC - 189, Gulshan 1"
        
        let vc = (storyboard?.instantiateViewController(withIdentifier: "ContactViewController")) as! ContactViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    private func decorateTextField(tf: UITextField){
        tf.borderStyle = .none
        tf.font = UIFont.init(name: "Nunito", size: 30)
        tf.placeholder = "Business address"
    }
    
    func loadSingletapGestureRecognizer(){
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.singleTap(sender:)))
        singleTapGestureRecognizer.numberOfTapsRequired = 1
        singleTapGestureRecognizer.isEnabled = true
        singleTapGestureRecognizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(singleTapGestureRecognizer)
    }
    
    @objc func singleTap(sender: UITapGestureRecognizer) {
        self.addressTextField.resignFirstResponder()
    }

}
