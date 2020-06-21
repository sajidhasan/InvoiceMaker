//
//  PreviewViewController.swift
//  InvoiceMaker
//
//  Created by Sajid Hasan on 22/6/20.
//  Copyright © 2020 Sajidd. All rights reserved.
//

import UIKit
import PDFKit

class PreviewViewController: UIViewController {


    @IBOutlet weak var continuewButton: UIButton!
    
    public var documentData: Data?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continuewButton.layer.cornerRadius = 10
        loadPDF()
        
    }
    
    @IBAction func continuewButtonPressed(_ sender: Any) {
    }
    func loadPDF(){
        let pdfView = PDFView()

        pdfView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pdfView)

        pdfView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        pdfView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        //pdfView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        pdfView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        pdfView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        
        if let data = documentData {
          pdfView.document = PDFDocument(data: data)
          pdfView.autoScales = true
          
        }

    }
    
    


}
