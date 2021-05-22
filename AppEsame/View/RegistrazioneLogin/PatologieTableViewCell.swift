//
//  PatologiaTableViewCell.swift
//  AppEsame
//
//  Created by Anna on 13/05/2021.
//

import UIKit
import DLRadioButton

class PatologieTableViewCell: UITableViewCell {

   
    @IBOutlet weak var nomePatologia: UILabel!
   
    @IBOutlet weak var seleziona: DLRadioButton!
    
    func initCell(nomePatologia: String){
        self.nomePatologia.text = nomePatologia
        seleziona.isMultipleSelectionEnabled = true
    }
    
}
