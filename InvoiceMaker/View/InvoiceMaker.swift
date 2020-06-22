//
//  InvoiceMaker.swift
//  InvoiceMaker
//
//  Created by Sajid Hasan on 22/6/20.
//  Copyright © 2020 Sajidd. All rights reserved.
//

import UIKit
import PDFKit

class InvoiceMaker: NSObject {
    
    let businessName = business.businessName
    let businessAddress = business.businessAddress
    let businessContact = business.businessContact
    
    func createInvoice() -> Data {
        let pdfMetaData = [kCGPDFContextCreator: "Sajid Hasan",
                           kCGPDFContextAuthor: "sajidd.com",
                           kCGPDFContextTitle: "Sajid Hasan"]
        
        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = pdfMetaData as [String: Any]
        
        let pageWidth = 8.5 * 72.0
        let pageHeight = 11 * 72.0
        let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
        
        let data = renderer.pdfData { (context) in
            context.beginPage()
            let titleBottom = addTitle(pageRect: pageRect)
            let addressBottom = addAddress(pageRect: pageRect, addressTop: titleBottom)
            let contactbottom = addContact(pageRect: pageRect, contactTop: addressBottom)
            //let imageBottom = addImage(pageRect: pageRect, imageTop: titleBottom + 18.0)
            //addBodyText(pageRect: pageRect, textTop: imageBottom + 18.0)
        }
        return data
        
    }
    
    private func addTitle(pageRect: CGRect) -> CGFloat {
      
      let titleFont = UIFont.init(name: "Nunito", size: 18)
      let titleAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: titleFont!]
      let attributedTitle = NSAttributedString(string: businessName, attributes: titleAttributes)
      let titleStringSize = attributedTitle.size()
      let titleStringRect = CGRect(x: (pageRect.width - titleStringSize.width) / 2.0, y: 36, width: titleStringSize.width, height: titleStringSize.height)
      
      attributedTitle.draw(in: titleStringRect)
      
      return titleStringRect.origin.y + titleStringRect.size.height
    }
    
    private func addAddress(pageRect: CGRect, addressTop: CGFloat) -> CGFloat{
        
        let addressFont = UIFont.init(name: "Nunito", size: 12)
        let addressAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: addressFont!]
        let attributedAddress = NSAttributedString(string: businessAddress, attributes: addressAttributes)
        let addressStringSize = attributedAddress.size()
        let addressStringRect = CGRect(x: (pageRect.width - addressStringSize.width ) / 2.0, y: addressTop, width: addressStringSize.width, height: addressStringSize.height)
        
        attributedAddress.draw(in: addressStringRect)
        
        return addressStringRect.origin.y + addressStringRect.size.height
    }
    
    private func addContact(pageRect: CGRect, contactTop: CGFloat) -> CGFloat{
        let contacFont = UIFont.init(name: "Nunito", size: 12)
        let contactAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: contacFont!]
        let attributedContact = NSAttributedString(string: businessContact, attributes: contactAttributes)
        let contactStringSize = attributedContact.size()
        let contactStringRect = CGRect(x: (pageRect.width - contactStringSize.width) / 2.0, y: contactTop, width: contactStringSize.width, height: contactStringSize.height)
        
        attributedContact.draw(in: contactStringRect)
        
        return contactStringRect.origin.y + contactStringRect.size.height
    }
    
    
}
