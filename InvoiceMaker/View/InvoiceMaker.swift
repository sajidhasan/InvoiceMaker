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
            //let imageBottom = addImage(pageRect: pageRect, imageTop: titleBottom + 18.0)
            //addBodyText(pageRect: pageRect, textTop: imageBottom + 18.0)
        }
        return data
        
    }
    
    func addTitle(pageRect: CGRect) -> CGFloat {
      
      let titleFont = UIFont.init(name: "Nunito", size: 18)
      let titleAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: titleFont!]
      let attributedTitle = NSAttributedString(string: businessName, attributes: titleAttributes)
      let titleStringSize = attributedTitle.size()
      let titleStringRect = CGRect(x: (pageRect.width - titleStringSize.width) / 2.0, y: 36, width: titleStringSize.width, height: titleStringSize.height)
      
      attributedTitle.draw(in: titleStringRect)
      
      return titleStringRect.origin.y + titleStringRect.size.height
    }
    
    
}
