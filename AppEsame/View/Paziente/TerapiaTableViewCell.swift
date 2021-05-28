//
//  TerapiaTableViewCell.swift
//  AppEsame
//
//  Created by Anna on 24/05/2021.
//

import UIKit

class TerapiaTableViewCell: UITableViewCell {

  
    @IBOutlet weak var nomeMedicinale: UILabel!
    @IBOutlet weak var pdfButton: UIButton!
    
    func initcell(){
        pdfButton.layer.cornerRadius = 5
    }
}
