//
//  CustomerViewController.swift
//  InvoiceMaker
//
//  Created by Sajid Hasan on 29/6/20.
//  Copyright © 2020 Sajidd. All rights reserved.
//

import UIKit


var customer = Customer(name: "Sajid Hasan", address: "Mountain View, CA", phone: "122039302", email: "sajid@email.com")

class CustomerViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decorateTextField(tf: nameTextField, placeholder: "Name")
        decorateTextField(tf: addressTextField, placeholder: "Address")
        decorateTextField(tf: emailTextField, placeholder: "E-mail")
        decorateTextField(tf: phoneTextField, placeholder: "Phone number")
        loadSingletapGestureRecognizer()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        customer.name = nameTextField.text!
        customer.address = addressTextField.text!
        customer.email = emailTextField.text!
        customer.phone = phoneTextField.text!
        
        let invoiceMaker = InvoiceMaker()
        let vc = (storyboard?.instantiateViewController(withIdentifier: "PreviewViewController")) as! PreviewViewController
        vc.documentData = invoiceMaker.createInvoice()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    private func decorateTextField(tf: UITextField, placeholder: String){
        tf.borderStyle = .none
        tf.font = UIFont.init(name: "Nunito", size: 20)
        tf.placeholder = placeholder
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
         self.view.frame.origin.y = -150 // Move view 150 points upward
    }

    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0 // Move view to original position
    }
    
    func loadSingletapGestureRecognizer(){
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.singleTap(sender:)))
        singleTapGestureRecognizer.numberOfTapsRequired = 1
        singleTapGestureRecognizer.isEnabled = true
        singleTapGestureRecognizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(singleTapGestureRecognizer)
    }
    
    @objc func singleTap(sender: UITapGestureRecognizer) {
        self.nameTextField.resignFirstResponder()
        self.addressTextField.resignFirstResponder()
        self.emailTextField.resignFirstResponder()
        self.phoneTextField.resignFirstResponder()
    }
    

}
