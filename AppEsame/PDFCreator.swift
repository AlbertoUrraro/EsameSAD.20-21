//
//  PDFCreator.swift
//  AppEsame
//
//  Created by Anna on 03/07/2021.
//

import Foundation
import PDFKit

class PDFCreator: NSObject {
  let title: String
    let medicinale: [String]!
    let descrizione: String!
    
    
    
    init(title: String, medicinale: [String], descrizione: String){
        self.title = title
        self.medicinale = medicinale
        self.descrizione = descrizione
    }
    
    func createFlyer() -> Data {
      // 1
      let pdfMetaData = [
        kCGPDFContextCreator: "Flyer Builder",
        kCGPDFContextAuthor: "raywenderlich.com",
        kCGPDFContextTitle: title
      ]
      let format = UIGraphicsPDFRendererFormat()
      format.documentInfo = pdfMetaData as [String: Any]
      
      // 2
      let pageWidth = 8.5 * 72.0
      let pageHeight = 11 * 72.0
      let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
      
      // 3
      let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
      // 4
      let data = renderer.pdfData { (context) in
        // 5
        context.beginPage()
        // 6
        let titleBottom = addTitle(pageRect: pageRect)
        var i = 0
        var medicinaleBottom:CGFloat!
        while(i<medicinale.count){
            if (i==0){
    
                addMedicinale(pageRect: pageRect, i: i, top:titleBottom )
           
                addDescrizione(pageRect:pageRect, i: i, top:titleBottom )
                medicinaleBottom = titleBottom + 70.0
            }
            else{
                addMedicinale(pageRect: pageRect, i: i, top : medicinaleBottom)
                addDescrizione(pageRect:pageRect, i: i, top:medicinaleBottom)
                medicinaleBottom = medicinaleBottom + 70.0
            }
            i = i+1
      }
      }
      return data
    }
        
    
    func addTitle(pageRect: CGRect) -> CGFloat {
      // 1
      let titleFont = UIFont.systemFont(ofSize: 18.0, weight: .bold)
      // 2
      let titleAttributes: [NSAttributedString.Key: Any] =
        [NSAttributedString.Key.font: titleFont]
      let attributedTitle = NSAttributedString(string: title, attributes: titleAttributes)
      // 3
      let titleStringSize = attributedTitle.size()
      // 4
      let titleStringRect = CGRect(x: (pageRect.width - titleStringSize.width) / 2.0,
                                   y: 36, width: titleStringSize.width,
                                   height: titleStringSize.height)
      // 5
      attributedTitle.draw(in: titleStringRect)
      // 6
      return titleStringRect.origin.y + titleStringRect.size.height
    }
    
    func addMedicinale(pageRect: CGRect, i: Int, top: CGFloat){
        
        // 1
        let titleFont = UIFont.systemFont(ofSize: 18.0, weight: .regular)
        // 2
        let medicinaleAttributes: [NSAttributedString.Key: Any] =
          [NSAttributedString.Key.font: titleFont]
        
        let attributeMedicinale = NSAttributedString(string: medicinale[i], attributes: medicinaleAttributes)
        // 3
        let medicinaleStringSize = attributeMedicinale.size()
        
        let medicinaleStringRect = CGRect(x: 10, y: top+70, width: pageRect.width - 20,height: pageRect.height - top - pageRect.height / 5.0)
        // 5
        attributeMedicinale.draw(in: medicinaleStringRect)
    }
    
    func addDescrizione(pageRect: CGRect, i: Int, top: CGFloat){
        
        // 1
        let titleFont = UIFont.systemFont(ofSize: 18.0, weight: .regular)
        // 2
        let nomeAttributes: [NSAttributedString.Key: Any] =
          [NSAttributedString.Key.font: titleFont]
        
        let attributeNome = NSAttributedString(string: descrizione, attributes: nomeAttributes)
        // 3
        let nomeStringSize = attributeNome.size()
        
        let nomeStringRect = CGRect(x: 300, y: top+70, width: pageRect.width - 20,height: pageRect.height - top - pageRect.height / 5.0)
        // 5
        attributeNome.draw(in: nomeStringRect)
    }
}
