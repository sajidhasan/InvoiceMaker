//
//  ViewController.swift
//  InvoiceMaker
//
//  Created by Sajid Hasan on 21/6/20.
//  Copyright © 2020 Sajidd. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var createNewButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showCreateNewButton()
        
//        let vc = (storyboard?.instantiateViewController(withIdentifier: "CustomerViewController")) as! CustomerViewController
//        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    private func showCreateNewButton(){
        createNewButton.layer.cornerRadius = 10
        
    }


    @IBAction func createNewButtonPressed(_ sender: UIButton) {
        
        let vc = (storyboard?.instantiateViewController(withIdentifier: "NameViewController")) as! NameViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}

