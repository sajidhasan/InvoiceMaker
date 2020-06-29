//
//  ContactViewController.swift
//  InvoiceMaker
//
//  Created by Sajid Hasan on 21/6/20.
//  Copyright © 2020 Sajidd. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 10
        decorateTextField(tf: emailTextField, placeholder: "name@email.com")
        decorateTextField(tf: phoneTextField, placeholder: "+8801611282830")
        
        loadSingletapGestureRecognizer()

    }
    
    private func decorateTextField(tf: UITextField, placeholder: String){
        tf.borderStyle = .none
        tf.font = UIFont.init(name: "Nunito", size: 30)
        tf.placeholder = placeholder
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        let contact = "E-mail: \(emailTextField.text!), Phone: \(phoneTextField.text!)"
        business.businessContact = contact
//        let invoiceMaker = InvoiceMaker()
//        let vc = (storyboard?.instantiateViewController(withIdentifier: "PreviewViewController")) as! PreviewViewController
//        vc.documentData = invoiceMaker.createInvoice()
//        navigationController?.pushViewController(vc, animated: true)
        
        let vc = (storyboard?.instantiateViewController(withIdentifier: "CustomerViewController")) as! CustomerViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func loadSingletapGestureRecognizer(){
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.singleTap(sender:)))
        singleTapGestureRecognizer.numberOfTapsRequired = 1
        singleTapGestureRecognizer.isEnabled = true
        singleTapGestureRecognizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(singleTapGestureRecognizer)
    }
    
    @objc func singleTap(sender: UITapGestureRecognizer) {
        self.emailTextField.resignFirstResponder()
        self.phoneTextField.resignFirstResponder()
    }
    
}
