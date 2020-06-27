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
        
        //8.3 * 11.7 - A4 size
        //8.5 * 11 - US letter size
        
        let pageWidth = 8.5 * 72.0
        let pageHeight = 11 * 72.0
        let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
        
        let data = renderer.pdfData { (context) in
            context.beginPage()
            let titleBottom = addTitle(pageRect: pageRect)
            let addressBottom = addAddress(pageRect: pageRect, addressTop: titleBottom)
            let contactBottom = addContact(pageRect: pageRect, contactTop: addressBottom)
            let dateBottom = addDate(pageRect: pageRect, dateTop: contactBottom, fontName: "Nunito", fontSize: 12)
            
            let context = context.cgContext
            let lineBottom = drawLine(context, pageRect: pageRect, lineY: dateBottom)
            let customerNameBottom = addCustomerDetails(pageRect: pageRect, customerTop: lineBottom)
            //let imageBottom = addImage(pageRect: pageRect, imageTop: titleBottom + 18.0)
            //addBodyText(pageRect: pageRect, textTop: imageBottom + 18.0)
        }
        return data
        
    }
    
    private func addTitle(pageRect: CGRect) -> CGFloat {
        
        let titleFont = UIFont.init(name: "Nunito", size: 18)
        let greenColor = UIColor(red: 10/255, green: 190/255, blue: 50/255, alpha: 1)
        let titleAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: titleFont!, NSAttributedString.Key.foregroundColor : greenColor]
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
    
    
    private func addDate(pageRect: CGRect, dateTop: CGFloat, fontName: String, fontSize: CGFloat) -> CGFloat{
        let dateFont = UIFont.init(name: fontName, size: fontSize)
        let dateAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: dateFont!]
        let attributedDate = NSAttributedString(string: "Date: " + getDate(), attributes: dateAttributes)
        
        let dateStringSize = attributedDate.size()
        
        let dateStringRect = CGRect(x: pageRect.width - dateStringSize.width - 72, y: dateTop, width: dateStringSize.width, height: dateStringSize.height)
        
        attributedDate.draw(in: dateStringRect)
        
        return dateStringRect.origin.y + dateStringRect.size.height

    }
    
    private func getDate() -> String {
        let now = Date()

        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none

        let datetime = formatter.string(from: now)
        return datetime
    }
    
    private func drawLine(_ drawContext: CGContext, pageRect: CGRect, lineY: CGFloat) -> CGFloat{
        drawContext.saveGState()
        drawContext.setLineWidth(1.0)
        drawContext.move(to: CGPoint(x: 0, y: lineY))
        drawContext.addLine(to: CGPoint(x: pageRect.width, y: lineY))
        drawContext.strokePath()
        drawContext.restoreGState()
        
        drawContext.saveGState()
        
        let lineBottom = lineY + 2
        
        return lineBottom
        
    }
    
    private func addCustomerDetails(pageRect: CGRect, customerTop: CGFloat) -> CGFloat{
        let namefont = UIFont.init(name: "Nunito", size: 18)
        let nameAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: namefont!]
        let attributedName = NSAttributedString(string: "Sajid Hasan", attributes: nameAttributes)
        let nameStringSize = attributedName.size()
        let nameStringRect = CGRect(x: 72, y: customerTop, width: nameStringSize.width, height: nameStringSize.height)
        
        attributedName.draw(in: nameStringRect)
        
        let nameBottom = nameStringRect.origin.y + nameStringRect.height
        
        let font = UIFont.init(name: "Nunito", size: 12)
        let attributes = [NSAttributedString.Key.font: font!]
        let attributedAddress = NSAttributedString(string: "House 3/I, Road 7, Block - G, Bashundhara R/A", attributes: attributes)
        let addressStringSize = attributedAddress.size()
        
        let addressStringRect = CGRect(x: 72, y: nameBottom, width: addressStringSize.width, height: addressStringSize.height)
        attributedAddress.draw(in: addressStringRect)
        
        let addressBottom = addressStringRect.origin.y + addressStringRect.height
        
        return nameStringRect.origin.y + nameStringRect.height
        
        
    }
    
}
